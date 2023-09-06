import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/hive_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic items = 'On Going';
  List list = ['On Going', 'Completed', 'Not Completed', 'Deleted'];
  final _titelControllar = TextEditingController();
  final _descControllar = TextEditingController();
  final _dateControllar = TextEditingController();
  final _timeControllar = TextEditingController();

@override
 void initState() {
    HiveHelper.getTask();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        backgroundColor: Colors.blue[100],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.white,
                  selectedTextColor: Colors.black,
                  onDateChange: (date) {},
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: 280,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: MaterialButton(
                  onPressed: () {
                    _titelControllar.clear();
                    _descControllar.clear();
                    _dateControllar.clear();
                    _timeControllar.clear();
                    _buildShowModalBottomSheet(context);
                  },
                  child: const Text(
                    "Add new task +",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    const Text(
                      'Tasks',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      width: 170,
                    ),
                    DropdownButton(
                      hint: const Text('On Going'),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      dropdownColor: Colors.blue[100],
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 25,
                      ),
                      items: list
                          .map((e) =>
                              DropdownMenuItem(value: e, child: Text("$e")))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          items = val;
                        });
                      },
                      value: items,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Column(
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: HiveHelper.title.length,
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 7,
                          ),
                      itemBuilder: (context, index) => Stack(
              children: [
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                  child: _showListView(index),
                onTap: (){
                  _titelControllar;
                  _descControllar;
                  _dateControllar;
                  _timeControllar;
                  _modifyShowModalBottomSheet(context, index);
                },
              ),
              )
            ],)
          )
                ],
              ),

            ],
          ),
        ));
  }

  Future<dynamic> _modifyShowModalBottomSheet(BuildContext context, int index) {
    return showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          //height: 1000,
                            child: Container(
                              color:Colors.blue[100],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'New Task',
                                      style: TextStyle(fontSize: 18, color: Colors.white),
                                    ),
                                    const Divider(
                                      color: Colors.white,
                                      indent: 20,
                                      endIndent: 20,
                                      thickness: 1,
                                      height: 20,
                                    ),
                                    const Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Task title',
                                            style: TextStyle(fontSize: 16, color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: TextFormField(
                                          controller: _titelControllar,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            hintText: "Add Task Name",
                                            filled: true,
                                            fillColor: Colors.white,
                                            enabledBorder:
                                            OutlineInputBorder(borderSide: BorderSide.none),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Description',
                                            style: TextStyle(fontSize: 16, color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: TextFormField(
                                          controller: _descControllar,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            hintText: "Add Description...",
                                            filled: true,
                                            fillColor: Colors.white,
                                            enabledBorder:
                                            OutlineInputBorder(borderSide: BorderSide.none),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(
                                                'Date',
                                                style:
                                                TextStyle(fontSize: 16, color: Colors.white),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              height: 40,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(10)),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.symmetric(horizontal: 5),
                                                child: TextFormField(
                                                  controller: _dateControllar,
                                                  keyboardType: TextInputType.datetime,
                                                  decoration: const InputDecoration(
                                                    prefixIcon:
                                                    Icon(Icons.calendar_month_rounded),
                                                    hintText: "dd/mm/yy",
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide.none),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Time',
                                              style: TextStyle(fontSize: 16, color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              height: 40,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(10)),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.symmetric(horizontal: 5),
                                                child: TextFormField(
                                                  controller: _timeControllar,
                                                  keyboardType: TextInputType.datetime,
                                                  decoration: const InputDecoration(
                                                    prefixIcon: Icon(Icons.timelapse),
                                                    hintText: "hh:mm",
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide.none),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: ()  {
                                            if (_titelControllar.text.isNotEmpty ||
                                                _descControllar.text.isNotEmpty ||
                                                _dateControllar.text.isNotEmpty ||
                                                _timeControllar.text.isNotEmpty) {
                                              HiveHelper.tasksUpdate(index, _titelControllar.text,
                                                  _descControllar.text,_dateControllar.text,
                                                  _timeControllar.text);
                                              Navigator.pop(context);

                                              setState(() {});
                                            }
                                          },
                                          child: Container(
                                              height: 50,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white),
                                              child: const Center(
                                                child: Text(
                                                  'Add',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);

                                              setState(() {});
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color:Colors.white),
                                              child: const Center(
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ));
                      });
  }

  Future<dynamic> _buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            //height: 1000,
                              child: Container(
                                color: Colors.blue[100],
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'New Task',
                                        style: TextStyle(fontSize: 18, color: Colors.white),
                                      ),
                                      const Divider(
                                        color: Colors.white,
                                        indent: 20,
                                        endIndent: 20,
                                        thickness: 1,
                                        height: 20,
                                      ),
                                      const Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Task title',
                                              style: TextStyle(fontSize: 16, color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          child: TextFormField(
                                            controller: _titelControllar,
                                            keyboardType: TextInputType.text,
                                            decoration: const InputDecoration(
                                              hintText: "Add Task Name",
                                              filled: true,
                                              fillColor: Colors.white,
                                              enabledBorder:
                                              OutlineInputBorder(borderSide: BorderSide.none),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Description',
                                              style: TextStyle(fontSize: 16, color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          child: TextFormField(
                                            controller: _descControllar,
                                            keyboardType: TextInputType.text,
                                            decoration: const InputDecoration(
                                              hintText: "Add Description...",
                                              filled: true,
                                              fillColor: Colors.white,
                                              enabledBorder:
                                              OutlineInputBorder(borderSide: BorderSide.none),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(left: 5),
                                                child: Text(
                                                  'Date',
                                                  style:
                                                  TextStyle(fontSize: 16, color: Colors.white),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                height: 40,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.symmetric(horizontal: 5),
                                                  child: TextFormField(
                                                    controller: _dateControllar,
                                                    keyboardType: TextInputType.datetime,
                                                    decoration: const InputDecoration(
                                                      prefixIcon:
                                                      Icon(Icons.calendar_month_rounded),
                                                      hintText: "dd/mm/yy",
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide.none),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 40,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Time',
                                                style: TextStyle(fontSize: 16, color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                height: 40,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.symmetric(horizontal: 5),
                                                  child: TextFormField(
                                                    controller: _timeControllar,
                                                    keyboardType: TextInputType.datetime,
                                                    decoration: const InputDecoration(
                                                      prefixIcon: Icon(Icons.timelapse),
                                                      hintText: "hh:mm",
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide.none),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (_titelControllar.text.isNotEmpty ||
                                                  _descControllar.text.isNotEmpty ||
                                                  _dateControllar.text.isNotEmpty ||
                                                  _timeControllar.text.isNotEmpty) {
                                                HiveHelper.tasksAdd(_titelControllar.text,
                                                    _descControllar.text,_dateControllar.text,
                                                    _timeControllar.text);

                                                Navigator.pop(context);

                                                setState(() {});
                                              }
                                            },
                                            child: Container(
                                                height: 50,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white),
                                                child: const Center(
                                                  child: Text(
                                                    'Add',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                )),
                                          ),
                                          const SizedBox(
                                            width: 50,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);

                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color:Colors.white),
                                                child: const Center(
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        });
  }

  AppBar _appBar() {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[100],
        leading: const Icon(Icons.menu),
        title: const Text('To-Do'),
        actions: [
          const Icon(Icons.search),
          const SizedBox(
            width: 20,
          ),
          InkWell(
              child: const Icon(Icons.delete),
            onTap: (){
              HiveHelper.removeall();
            setState(() {

            });
            },
            ),
          const SizedBox(
            width: 12,
          ),
        ],
      );
  }

  Container _showListView(int index) {
    return Container(
                height: 120,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            HiveHelper.title[index],
                            style: const TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 240,
                          ),
                          InkWell(
                            child: const Icon(Icons.delete),
                            onTap: (){
                              HiveHelper.remove(index);
                              setState(() {
                              });
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 2),
                        child: Text(
                          HiveHelper.description[index],
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Text(
                            HiveHelper.date[index],
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            HiveHelper.time[index],
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
  }




}
