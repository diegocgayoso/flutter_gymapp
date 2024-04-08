import "package:flutter/material.dart";
import "package:flutter_my_first_app/_core/my_colors.dart";

showSnackBar(
    {required BuildContext context, required String text, bool isErr = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(text),
    backgroundColor: (isErr) ? MyColors.redAlert : MyColors.greenSuccess,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
    duration: const Duration(seconds: 5),
    action: SnackBarAction(
      label: "x",
      textColor: Colors.grey[300],
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
