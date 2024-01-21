import 'package:bt_app/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:auto_size_text/auto_size_text.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserInfoNormal();
  }
}

class UserInfoNormal extends StatefulHookConsumerWidget {
  const UserInfoNormal({super.key});

  @override
  UserInfoNormalState createState() => UserInfoNormalState();
}

class UserInfoNormalState extends ConsumerState<UserInfoNormal>
    with SingleTickerProviderStateMixin {
  UserInfoNormalState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final userController = ref.watch(userProvider);

    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: ref.read(userProvider.notifier).isAuthenticated()
                ? CachedNetworkImageProvider(userController.value!.avatarUrl)
                : null,
            backgroundColor: const Color.fromARGB(255, 39, 7, 153),
            radius: 32,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hi,',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.apply(fontWeightDelta: 1),
                      )),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      'username',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.apply(fontWeightDelta: 4),
                      maxLines: 1,
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            onTap: () {},
            child: Ink(
              width: 100,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(136, 68, 228, 1),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding:
                  const EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 10),
              child: Row(
                children: [
                  Text(
                    '1,032',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.apply(fontWeightDelta: 1),
                  ),
                  const SizedBox(width: 6),
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/pol/matic-logo.png"),
                    radius: 15,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UserInfoShimmer extends StatelessWidget {
  const UserInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          child: Row(children: [
            Shimmer.fromColors(
                baseColor: Colors.blueGrey,
                highlightColor: Colors.grey,
                child: const CircleAvatar(radius: 32)),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: width * 0.4,
                    child: Text(
                      'Hi,',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineLarge,
                    )),
                SizedBox(
                    width: width * 0.4,
                    child: Text(
                      'username',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ))
              ],
            )
          ]),
        ),
        Shimmer.fromColors(
            baseColor: Colors.blueGrey,
            highlightColor: Colors.grey,
            child: Container(
              height: 43,
              width: 100,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(136, 68, 228, 1),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding:
                  const EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 10),
            ))
      ]),
    );
  }
}
