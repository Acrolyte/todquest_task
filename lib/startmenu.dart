import 'package:flutter/material.dart';
class StartMenu extends StatefulWidget {
  const StartMenu({Key? key}) : super(key: key);

  @override
  State<StartMenu> createState() => _StartMenuState();
}

class _StartMenuState extends State<StartMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome'), centerTitle: true,),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){ Navigator.pushNamed(context, 'task1');}, child: Text('  Task 1  ')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){ Navigator.pushNamed(context, 'task2');}, child: Text('  Task 2  ')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){ Navigator.pushNamed(context, 'task3');}, child: Text('  Task 3  ')),
          ],
        ),
      ),
    );
  }
}
