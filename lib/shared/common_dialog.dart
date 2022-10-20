import 'package:flutter/material.dart';

class CommonDialog {
  static closeVisibleDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  static showLoadingDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                ),
                width: 80,
                height: 80,
                child: const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: CircularProgressIndicator(),
                )
            ),
          );
        });
  }

}