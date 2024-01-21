import 'package:bt_app/utils/prefs.dart';
import 'package:bt_app/controllers/various_controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class General extends HookConsumerWidget {
  const General({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SharedPrefs prefs = ref.watch(sharedPrefsProvider);
    ValueNotifier<bool> showAmounts = useState(prefs.showAmounts());
    ValueNotifier<bool> enableNotifications =
        useState(prefs.enableNotifications());

    double width = MediaQuery.of(context).size.width;

    useEffect(() {
      ref.read(sharedPrefsProvider).setShowAmounts(showAmounts.value);
      return;
    }, [showAmounts.value]);

    useEffect(() {
      ref
          .read(sharedPrefsProvider)
          .setEnableNotifications(enableNotifications.value);
      return;
    }, [enableNotifications.value]);

    return Column(children: [
      Title(
          color: Colors.white,
          child: SizedBox(
              width: width,
              child: Text(
                'General',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.apply(fontWeightDelta: 3),
              ))),
      const SizedBox(height: 10),
      Container(
        width: width,
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
                          backgroundColor: Colors.green,
                          radius: 20,
                          child: Icon(Icons.phonelink_ring_rounded)),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: width * 0.5,
                        child: Text(
                          'Push Notifications',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.apply(fontWeightDelta: 1),
                        ),
                      )
                    ],
                  ),
                  CupertinoSwitch(
                    value: enableNotifications.value,
                    onChanged: (value) {
                      Vibrate.feedback(FeedbackType.light);
                      enableNotifications.value = value;
                    },
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
                          backgroundColor: Colors.purple,
                          radius: 20,
                          child: Icon(Icons.remove_red_eye_outlined)),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: width * 0.5,
                        child: Text(
                          'Visible Amounts',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.apply(fontWeightDelta: 1),
                        ),
                      )
                    ],
                  ),
                  CupertinoSwitch(
                    value: showAmounts.value,
                    onChanged: (value) {
                      Vibrate.feedback(FeedbackType.light);
                      showAmounts.value = value;
                    },
                  )
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
              child: InkWell(
                  onTap: () async {
                    ref.read(resetProvider.notifier).resetDatabase(true);
                    await ref.read(sharedPrefsProvider).setFirstLaunch(true);
                  },
                  child: Ink(
                      child: Row(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 20,
                              child: Icon(Icons.remove_red_eye_outlined)),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: width * 0.59,
                            child: Text(
                              'Reset DB',
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
                  ))))
        ]),
      )
    ]);
  }
}
