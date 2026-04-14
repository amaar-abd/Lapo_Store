import 'package:flutter/material.dart';

AppBar customAppBar(
  BuildContext context, 
  // String? titlle,
  // bool showButton = false,
) {
  return AppBar(
    backgroundColor: Colors.white,
    // centerTitle: true,
    // title: Text(titlle ?? '', style: TextTheme.of(context).displayMedium),
    // leading: Visibility(
    //   visible: showButton,
    //   child: IconButton(
    //     icon: Icon(Icons.arrow_back_rounded, size: 30),
    //     onPressed: () {
    //       Navigator.of(context).pop();
    //     },
    //   ),
    // ),
  );
}
