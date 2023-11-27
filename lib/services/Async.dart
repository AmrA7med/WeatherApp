import 'dart:io';

void main (){
  performtasks();
}
void performtasks(){
  task1();
  task2();
  task3();
}
void task1(){
  print('this is task1');
}
 task2() async{
  Duration threeseconds = Duration(seconds: 3);
 // sleep(threeseconds);
  await  Future.delayed(threeseconds,(){
     print('this is task2');
   });
}
void task3(){
  print('this is task3');
}
