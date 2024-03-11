import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

class Homescreencontroller {
  static TextEditingController titlecontroller = TextEditingController();
  static TextEditingController timecontroller = TextEditingController();
  List notekeys = [];

  var mybox = Hive.box("notebox");

  void adddata() {
    mybox.add({
      "title": titlecontroller.text,
      "time": timecontroller.text,
    });
    notekeys = mybox.keys.toList();
  }

  void deletedata(var key) {
    mybox.delete(key);
    notekeys = mybox.keys.toList();
  }

  void editdata(var key) {
    mybox.put(key, {
      "title": titlecontroller.text,
      "time": timecontroller.text,
    });
  }

  static void cleardata() {
    titlecontroller.clear();
    timecontroller.clear();
  }

  init() {
    notekeys = mybox.keys.toList();
  }
}
