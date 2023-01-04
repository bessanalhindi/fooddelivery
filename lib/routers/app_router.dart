import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navKey = GlobalKey();

  static goToScreen(Widget widget) {
    navKey.currentState!.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  static goAndNamedScreen(String routeName, String argument) {
    navKey.currentState!.pushNamed(routeName, arguments: argument);
  }

  static goAndReplaceScreen(Widget widget) {
    navKey.currentState!.pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  static goPopScreen() {
    navKey.currentState!.pop();
  }

  static showSnackBar({required String message, bool error = false}) {
    ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.greenAccent,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static showCustomDialug(String content) {
    showDialog(
        context: navKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () {
                  navKey.currentState!.pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
  static showLoaderDialog() {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: navKey.currentContext!,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  static hideLoadingDialoug() {
    navKey.currentState!.pop();
  }
  static showCustomDiaoug(String content) {
    showDialog(
        context: navKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            content: Text(content),
            actions: [
              TextButton(
                  onPressed: () {
                    navKey.currentState!.pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
}
