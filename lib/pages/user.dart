import 'dart:convert';

import 'package:bt_app/components/user/discord_login_button.dart';
import 'package:bt_app/controllers/user_controller.dart';
import 'package:bt_app/data/models.dart';
import 'package:bt_app/utils/config.dart';
import 'package:bt_app/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

String? url = config["EXCHANGE_CODE_URL"];
final Uri _url = Uri.parse(url!);

class DiscordBrowser extends InAppBrowser {
  final Function startDiscordPipeline;

  DiscordBrowser({required this.startDiscordPipeline});

  @override
  Future onBrowserCreated() async {}

  @override
  Future onLoadStart(url) async {
    if (url?.origin == config["REDIRECT_URL"]) {
      close();
      await startDiscordPipeline(url?.queryParameters["code"]);
    }
  }

  @override
  Future onLoadStop(url) async {}

  @override
  void onLoadError(url, code, message) {
    close();
  }

  @override
  void onProgressChanged(progress) {}

  @override
  void onExit() {}
}

class UserPage extends StatefulHookConsumerWidget {
  const UserPage({super.key});

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends ConsumerState<UserPage>
    with SingleTickerProviderStateMixin {
  UserPageState();

  @override
  Widget build(BuildContext context) {
    final userController = ref.watch(userProvider);

    return userController.when(
        data: (data) => UserView(data: data),
        error: (error, stackTrace) => const Center(),
        loading: () => const Center());
  }
}

class UserView extends StatefulHookConsumerWidget {
  final UsersModel? data;

  const UserView({super.key, required this.data});

  @override
  UserViewState createState() => UserViewState();
}

class UserViewState extends ConsumerState<UserView>
    with SingleTickerProviderStateMixin {
  UserViewState();

  bool isAuthorizing = false;

  void toggleAuthorizeFlag() {
    setState(() {
      isAuthorizing = !isAuthorizing;
    });
  }

  Future<void> startDiscordAuth() async {
    final InAppBrowser browser = DiscordBrowser(
        startDiscordPipeline: (String code) => startDiscordPipeline(code));

    var options = InAppBrowserClassOptions(
        ios: IOSInAppBrowserOptions(hideToolbarBottom: true),
        crossPlatform: InAppBrowserOptions(
            hideUrlBar: false, toolbarTopBackgroundColor: Colors.white),
        inAppWebViewGroupOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(javaScriptEnabled: true)));
    await browser.openUrlRequest(
        urlRequest: URLRequest(url: _url), options: options);
  }

  Future<void> startDiscordPipeline(String code) async {
    toggleAuthorizeFlag();

    SharedPrefs sharedPrefs = ref.watch(sharedPrefsProvider);

    Uri discordUrl = Uri.parse(config["API_ENDPOINT"]!);
    Uri serverUrl = Uri.parse("${config["SERVER_URL"]}/user/join");

    Map<String, dynamic> userData = await fetchUserJoinData(serverUrl, code);

    userData["data"]["id"] = userData["data"]["instagram_validation"];
    UsersModel usersModel = UsersModel.fromJson(userData["data"]);

    await ref.read(userProvider.notifier).saveUser(usersModel);
    final tokenResponse =
        await getRefreshTokens(discordUrl, userData["data"]["refresh_token"]);
    await sharedPrefs.setAccessToken(tokenResponse["access_token"]);
    ref.invalidate(userProvider);
  }

  Future<Map<String, dynamic>> fetchUserJoinData(
      Uri discordUrl, String code) async {
    final data = {
      'code': code,
    };

    final userResponse = await http.post(discordUrl, body: data);

    return jsonDecode(userResponse.body);
  }

  Future<Map<String, dynamic>> getRefreshTokens(
      Uri discordUrl, String refreshToken) async {
    final data = {
      'client_id': config["CLIENT_ID"],
      'client_secret': config["CLIENT_SECRET"],
      'grant_type': 'refresh_token',
      'refresh_token': refreshToken
    };

    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

    final tokenResponse =
        await http.post(discordUrl, headers: headers, body: data);
    return jsonDecode(tokenResponse.body);
  }

  @override
  Widget build(BuildContext context) {
    return widget.data != null
        ? UserLoggedView(userData: widget.data)
        : UserNotLoggedView(
            startDiscordAuth: startDiscordAuth, isAuthorizing: isAuthorizing);
  }
}

class UserNotLoggedView extends StatelessWidget {
  final bool isAuthorizing;
  final Function startDiscordAuth;

  const UserNotLoggedView(
      {super.key, required this.startDiscordAuth, required this.isAuthorizing});

  @override
  Widget build(BuildContext context) {
    return isAuthorizing
        ? const Center(child: CircularProgressIndicator())
        : Center(child: DiscordLoginButton(login: () => startDiscordAuth()));
  }
}

class UserLoggedView extends StatelessWidget {
  final UsersModel? userData;

  const UserLoggedView({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(16), children: [
      ListTile(
          title: const Text("Username"), trailing: Text(userData!.discordName)),
      ListTile(
        title: const Text("Discord Id"),
        trailing: Text(userData!.discordId),
      ),
      ListTile(
          title: const Text("Role"), trailing: Text(userData!.discordRole)),
      ListTile(title: const Text("Email"), trailing: Text(userData!.email)),
      ListTile(
        title: const Text("IG Code"),
        trailing: Text(userData!.instagramValidation),
      ),
      ListTile(
          title: const Text("IG Validated"),
          trailing: Text(userData!.instagramValidated ? "Yes" : "No")),
      ListTile(
        title: const Text("Setup Completed"),
        trailing: Text(userData!.setupComplete ? "Yes" : "No"),
      )
    ]);
  }
}
