// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/controller/homescreencontroller.dart';
import 'package:todo_app/utils/colorconstants.dart';
import 'package:todo_app/view/todocard/todocard.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var mybox = Hive.box("notebox");
  Homescreencontroller obj = Homescreencontroller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Todocolors.todogrey,
      body: obj.notekeys.isEmpty
          ? Center(
              child: Text("No Tasks Todo"),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                var element = mybox.get(obj.notekeys[index]);
                return Todocard(title: element["title"], time: element["time"]);
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: obj.notekeys.length),
      //appbar----------------------------
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            size: 35,
            color: Todocolors.todogrey,
          ),
        ),
        toolbarHeight: 70,
        backgroundColor: Todocolors.todoblack,
        title: Text(
          "Things To Do",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          SizedBox(height: 20),
          IconButton(
            onPressed: () {
              //bottom sheet-----------------------
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: Homescreencontroller.titlecontroller,
                          decoration: InputDecoration(
                            label: Text("Add"),
                            fillColor: Todocolors.todogrey,
                            border: OutlineInputBorder(),
                            filled: true,
                          ),
                          validator: (value) {
                            if (Homescreencontroller
                                .titlecontroller.text.isNotEmpty) {
                              return null;
                            } else {
                              return "enter a valid title";
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: Homescreencontroller.timecontroller,
                          decoration: InputDecoration(
                            label: Text("Time"),
                            fillColor: Todocolors.todogrey,
                            border: OutlineInputBorder(),
                            filled: true,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay(
                                          hour: Duration.hoursPerDay,
                                          minute: Duration.minutesPerHour));
                                },
                                icon: Icon(
                                  Icons.watch_later_outlined,
                                  color: Todocolors.todoblack,
                                )),
                          ),
                          validator: (value) {
                            if (Homescreencontroller
                                .titlecontroller.text.isNotEmpty) {
                              return null;
                            } else {
                              return "enter a valid time";
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Homescreencontroller.cleardata();
                                  },
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Center(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    height: 50,
                                    width: 190,
                                    decoration: BoxDecoration(
                                        color: Todocolors.todogrey,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    obj.adddata();
                                    Homescreencontroller.cleardata();
                                    setState(() {});
                                  },
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Center(
                                        child: Text(
                                          "Add",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    height: 50,
                                    width: 190,
                                    decoration: BoxDecoration(
                                        color: Todocolors.todogrey,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
              setState(() {});
            },
            icon: Icon(
              Icons.add,
              size: 35,
              color: Todocolors.todogrey,
            ),
          ),
        ],
      ),
    );
  }
}
