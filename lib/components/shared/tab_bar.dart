import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bt_app/controllers/various_controllers.dart';

class CustomTabBar extends StatefulHookConsumerWidget {
  final Function changePage;

  const CustomTabBar({super.key, required this.changePage});

  @override
  TabBarState createState() => TabBarState();
}

class TabBarState extends ConsumerState<CustomTabBar>
    with SingleTickerProviderStateMixin {
  TabBarState();

  void setCurrentTab(int index) {
    setState(() {
      ref.read(tabProvider.notifier).setCurrentTab(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTab = ref.watch(tabProvider);

    List tabs = [
      {
        "index": 0,
        "tab": (color) => InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              setState(() {
                ref.read(tabProvider.notifier).setCurrentTab(0);
              });
              context.go('/', extra: {});
            },
            child: Icon(
              Icons.home,
              color: color,
            )),
        "color": Colors.white,
      },
      {
        "index": 1,
        "tab": (color) => InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              setState(() {
                ref.read(tabProvider.notifier).setCurrentTab(1);
              });
              context.go('/latest/news');
            },
            child: Icon(
              Icons.menu_book_sharp,
              color: color,
            )),
        "color": Colors.white
      },
      {
        "index": 2,
        "tab": (color) => InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              setState(() {
                ref.read(tabProvider.notifier).setCurrentTab(2);
              });
              context.go('/user');
            },
            child: Icon(
              Icons.person,
              color: color,
            )),
        "color": Colors.white
      },
      {
        "index": 3,
        "tab": (color) => InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              setState(() {
                ref.read(tabProvider.notifier).setCurrentTab(3);
              });
              context.go('/actions');
            },
            child: Icon(
              CupertinoIcons.globe,
              color: color,
            )),
        "color": Colors.white
      },
      {
        "index": 4,
        "tab": (color) => InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              setState(() {
                ref.read(tabProvider.notifier).setCurrentTab(4);
              });
              context.go('/settings');
            },
            child: Icon(
              Icons.settings,
              color: color,
            )),
        "color": Colors.white
      }
    ];

    return SizedBox(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: tabs
                .toList()
                .map((e) => e["tab"](
                    currentTab.toString() == e["index"].toString()
                        ? e["color"]
                        : Colors.white60) as Widget)
                .toList()));
  }
}
