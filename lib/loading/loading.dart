import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog progressDialog;

showProgress(BuildContext context, String message, bool isDismissible) async {
  progressDialog = new ProgressDialog(context,
      type: ProgressDialogType.Normal, isDismissible: isDismissible);

  progressDialog.style(

      message: message,
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: Container(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: Colors.purple.shade800,
          ),),

      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      messageTextStyle: TextStyle(

          color: Colors.purple.shade800, fontSize: 19.0, fontWeight: FontWeight.w600));
  await progressDialog.show();
}

updateProgress(String message) {
  progressDialog.update(message: message);
}

hideProgress() async {
  if(progressDialog!=null)
    await progressDialog.hide();
}