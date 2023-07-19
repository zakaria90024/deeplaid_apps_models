import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:deeplaid_apps_models/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../login_deeplaid_apps/login.dart';

class DialogCustomm {


  static showAlertDialog(BuildContext context, String alart, String text) async {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) =>
          CupertinoAlertDialog(
            title:  Text(alart),
            content: Text(text),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(

                /// This parameter indicates this action is the default,
                /// and turns the action's text to bold text.
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No'),
              ),
              CupertinoDialogAction(

                /// This parameter indicates the action would perform
                /// a destructive action such as deletion, and turns
                /// the action's text color to red.
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.push((context),
                                 MaterialPageRoute(builder: (context) => Login(title: "", userid: "")));

                },
                child: const Text('Yes'),
              ),
            ],
          ),
    );
  }
  static showAlertDoneFail(BuildContext context, String alart, String text, String canceltext) async {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) =>
          CupertinoAlertDialog(
            title:  Text(alart),
            content: Text(text),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(

                /// This parameter indicates this action is the default,
                /// and turns the action's text to bold text.
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(canceltext),
              ),

            ],
          ),
    );
  }



}
