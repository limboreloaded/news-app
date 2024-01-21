import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Degenland extends StatelessWidget {
  const Degenland({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(children: [
      Title(
          color: Colors.white,
          child: SizedBox(
              width: width,
              child: Text(
                'Degenland',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.apply(fontWeightDelta: 3),
              ))),
      const SizedBox(height: 10),
      Container(
        // width: width,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 58, 55, 55),
            borderRadius: BorderRadius.circular(16)),
        child: Column(children: [
          const SizedBox(height: 20),
          Container(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Row(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/ig_logo.png'),
                          radius: 18),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: width * 0.59,
                        child: Text(
                          'Instagram',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.apply(fontWeightDelta: 1),
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    CupertinoIcons.chevron_right,
                    color: Colors.white,
                  )
                ],
              )),
          Divider(
            height: 10,
            color: Colors.grey,
            indent: width * 0.16,
          ),
          Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/discord_logo.png'),
                          backgroundColor: Colors.white,
                          radius: 18),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: width * 0.59,
                        child: Text(
                          'Discord',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.apply(fontWeightDelta: 1),
                        ),
                      )
                    ],
                  ),
                  const Icon(CupertinoIcons.chevron_right, color: Colors.white)
                ],
              )),
          Divider(
            height: 10,
            color: Colors.grey,
            indent: width * 0.16,
          ),
          Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('assets/opensea_logo.png'),
                          radius: 18),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: width * 0.59,
                        child: Text(
                          'OpenSea',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.apply(fontWeightDelta: 1),
                        ),
                      )
                    ],
                  ),
                  const Icon(CupertinoIcons.chevron_right, color: Colors.white)
                ],
              )),
          Divider(
            height: 10,
            color: Colors.grey,
            indent: width * 0.16,
          ),
          Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 14, top: 10),
              child: Row(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/world_icon.png'),
                          radius: 18),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: width * 0.59,
                        child: Text(
                          'Website',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.apply(fontWeightDelta: 1),
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    CupertinoIcons.chevron_right,
                    color: Colors.white,
                  )
                ],
              ))
        ]),
      )
    ]);
  }
}
