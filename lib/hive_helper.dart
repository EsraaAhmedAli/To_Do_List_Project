import 'package:hive/hive.dart';

class HiveHelper {
  static const  box ='Box_Name';
  static const  titlekey ='title_key';
  static const  descriptionkey ='description_key';
  static const  datekey ='date_key';
  static const  timekey ='time_key';
  static dynamic box1 =Hive.box(box);
  static List title = [];
  static List description = [];
  static List date = [];
  static List time = [];

  static void tasksAdd(String input1,String input2,String input3, String input4) async{
    title.add(input1);
    description.add(input2);
    date.add(input3);
    time.add(input4);
    await box1.put(titlekey,title);
    await box1.put(descriptionkey,description);
    await box1.put(datekey,date);
    await box1.put(timekey,time);
  }

  static void getTask(){
      title = box1.get(titlekey);
      description = box1.get(descriptionkey);
      date = box1.get(datekey);
      time = box1.get(timekey);

  }

  static void tasksUpdate(int index,String input1,String input2,String input3, String input4) async{
    title[index]=input1;
    description[index]=input2;
    date[index]=input3;
    time[index]=input4;
    await box1.put(titlekey,title);
    await box1.put(descriptionkey,description);
    await box1.put(datekey,date);
    await box1.put(timekey,time);
  }

  static void remove(int index)async{
    title.removeAt(index);
    description.removeAt(index);
    date.removeAt(index);
    time.removeAt(index);
    await box1.put(titlekey,title);
    await box1.put(descriptionkey,description);
    await box1.put(datekey,date);
    await box1.put(timekey,time);

  }

  static void removeall()async{
    title.clear();
    description.clear();
    date.clear();
    time.clear();
    await box1.put(titlekey,title);
    await box1.put(descriptionkey,description);
    await box1.put(datekey,date);
    await box1.put(timekey,time);

  }
}