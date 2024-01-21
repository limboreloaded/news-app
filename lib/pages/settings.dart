import 'package:bt_app/main.dart';
import 'package:flutter/material.dart';
import 'package:bt_app/components/settings/degenland.dart';
import 'package:bt_app/components/settings/general.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  SettingsPageState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    Widget logo = Image.asset(
      'assets/bt_logo.png',
      height: 140,
      width: 200,
    );

    return CustomScrollView(
      controller: PageWrapper.of(context)?.bottomBarController,
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          expandedHeight: height * 0.25,
          elevation: 0,
          flexibleSpace: LayoutBuilder(builder: (context, constraints) {
            double top = constraints.biggest.height;
            return FlexibleSpaceBar(
              centerTitle: true,
              title: top > height * 0.2
                  ? logo
                  : Text(
                      'Settings',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.apply(fontWeightDelta: 4),
                    ),
            );
          }),
          floating: true,
          snap: false,
          pinned: true,
        ),
        SliverList(
            delegate: SliverChildListDelegate(
          [
            Container(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                const General(),
                const SizedBox(height: 40),
                const Degenland(),
                SizedBox(height: height * 0.15),
              ]),
            )
          ],
        ))
      ],
    );
  }
}
