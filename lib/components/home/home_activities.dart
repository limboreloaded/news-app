import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// class HomeActivitiesNormal extends StatelessWidget {
//   const HomeActivitiesNormal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     DateTime currentTime = DateTime.now();
//     double width = MediaQuery.of(context).size.width;

//     return Foil(
//         isUnwrapped: false,
//         gradient: Foils.oilslick,
//         child: Container(
//           width: width,
//           padding:
//               const EdgeInsets.only(top: 40, left: 12, right: 12, bottom: 40),
//           child: Motion(
//             borderRadius: const BorderRadius.all(Radius.circular(20)),
//             child: InkWell(
//               borderRadius: const BorderRadius.all(Radius.circular(20)),
//               onTap: () {
//                 showFlexibleBottomSheet(
//                     useRootNavigator: true,
//                     anchors: [0, 0.5, 1],
//                     context: context,
//                     builder: (context, scrollController, bottomSheetOffset) {
//                       return const KnawledgeBottomSheet();
//                     });
//               },
//               child: Ink(
//                 width: width,
//                 height: 200,
//                 padding: const EdgeInsets.all(24),
//                 decoration: BoxDecoration(
//                   image: const DecorationImage(
//                       fit: BoxFit.cover,
//                       image: CachedNetworkImageProvider(
//                         'https://wallpaperaccess.com/full/3966884.jpg',
//                       )),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   children: [
//                     Column(
//                       children: [
//                         SizedBox(
//                             width: width,
//                             child: Text(
//                               'KNAWLEDGE HOUR',
//                               textAlign: TextAlign.left,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headlineSmall
//                                   ?.apply(fontWeightDelta: 3),
//                             )),
//                         SizedBox(
//                             width: width,
//                             child: Text(
//                               'Earn \$MATIC for every right answer!',
//                               textAlign: TextAlign.left,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall
//                                   ?.apply(fontWeightDelta: 1),
//                             ))
//                       ],
//                     ),
//                     const SizedBox(height: 25),
//                     Container(
//                       height: 70,
//                       width: width,
//                       margin: const EdgeInsets.only(left: 50, right: 50),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(40),
//                           color: const Color.fromARGB(255, 58, 55, 55)),
//                       child: Center(
//                         child: Text(
//                           timeago.format(
//                               currentTime.subtract(const Duration(hours: 5)),
//                               locale: 'en_short'),
//                           style: Theme.of(context)
//                               .textTheme
//                               .displayLarge
//                               ?.apply(fontWeightDelta: 4),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
// }

class HomeActivitiesShimmer extends StatelessWidget {
  const HomeActivitiesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey,
      child: Container(
        width: width,
        padding: const EdgeInsets.only(top: 40, left: 12, right: 12),
        child: Container(
          width: width,
          height: 200,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 90, 47, 98)),
        ),
      ),
    );
  }
}
