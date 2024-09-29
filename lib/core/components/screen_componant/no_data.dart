// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:graduation_project_user/core/themes/text_style.dart';
//
// import '../../asset_const/assets-const.dart';
//
// class NoDataScreen extends StatelessWidget {
//   const NoDataScreen({super.key, this.message = 'لا يوجد نتائج لعرضها!'});
//   final String message;
//   @override
//   Widget build(BuildContext context) {
//     double height=MediaQuery.sizeOf(context).height;
//     return Scaffold(
//       backgroundColor: Colors.white.withOpacity(0),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: height/3,
//               child: SvgPicture.asset(
//                 AssetsConst.noData,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             // const SizedBox(
//             //   height: 20,
//             // ),
//             Text(
//               message,
//               style: normalTextStyle(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
