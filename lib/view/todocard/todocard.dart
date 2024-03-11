// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:todo_app/controller/homescreencontroller.dart';

import 'package:todo_app/utils/colorconstants.dart';

class Todocard extends StatefulWidget {
  const Todocard({
    super.key,
    required this.title,
    required this.time,
    this.ondeletepressed,
    this.addpressed,
    this.oneditpressed,
  });
  final dynamic title;
  final dynamic time;
  final VoidCallback? ondeletepressed;
  final VoidCallback? addpressed;
  final VoidCallback? oneditpressed;

  @override
  State<Todocard> createState() => _TodocardState();
}

class _TodocardState extends State<Todocard> {
  Homescreencontroller obj = Homescreencontroller();
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            height: 50,
            child: Row(
              children: [
                Checkbox(
                  checkColor: Todocolors.todogrey,
                  splashRadius: 10,
                  activeColor: Todocolors.todoblack,
                  value: ischecked,
                  onChanged: (value) {
                    ischecked = !ischecked;
                    setState(() {});
                  },
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Todocolors.todoblack,
                      fontSize: 20),
                ),
                Spacer(),
                Text(
                  widget.time,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                  color: Todocolors.todoblack,
                ),
                IconButton(
                    onPressed: widget.ondeletepressed,
                    icon: Icon(
                      Icons.delete,
                      color: Todocolors.todoblack,
                    ))
              ],
            ),
            width: 380,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Todocolors.todoblack, width: 3)),
          ),
        ],
      ),
    );
  }
}
