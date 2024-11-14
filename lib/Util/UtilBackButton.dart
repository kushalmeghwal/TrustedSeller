// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class BackButtonScaffold extends StatelessWidget {
//   final String title;
//   final Widget child;

//   const BackButtonScaffold({
//     Key? key,
//     required this.title,
//     required this.child,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (Navigator.of(context).canPop()) {
//           Navigator.of(context).pop();
//         } else {
//           // Exit the app if on the first page
//           SystemNavigator.pop();
//         }
//         return false;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               if (Navigator.of(context).canPop()) {
//                 Navigator.of(context).pop();
//               } else {
//                 SystemNavigator.pop(); // Exit the app on the first page
//               }
//             },
//           ),
//         ),
//         body: child,
//       ),
//     );
//   }
// }
