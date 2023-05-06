import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Task1 extends StatefulWidget {
  const Task1({Key? key}) : super(key: key);

  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  getPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  String _folderpath = "";
  bool isLoading = false;

  Future<String?> pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      _folderpath = (await FilePicker.platform.getDirectoryPath())!;

      print("Folder path ${_folderpath}");

      if (_folderpath != null) {
        _listofFiles();
        setState(() {
          files;
        });
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {}
    return _folderpath;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // pickFile();
    getPermission();
    // _listofFiles();
  }

  List<String> files = [];

  Future<void> _listofFiles() async {
    setState(() {
      List<FileSystemEntity> listdata =
          Directory(_folderpath).listSync(recursive: true);
      for (FileSystemEntity i in listdata) {
        files.add(
            '${"${i.path.split("/").reversed.toList()[1]} : " + i.path.split("/").reversed.toList()[0]}\n');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Task 1"),
          centerTitle: true,
        ),
        body: Container(
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                    onPressed: () {
                      files = [];
                      pickFile();
                      print('Got Folder: $_folderpath');

                      // _listofFiles().whenComplete(());
                      // Navigator.pushNamed(context, 'task2');
                    },
                    child: const Text('Get Files')),
              ],
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: files.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(files[index].toString());
                    })),
          ]),
        ));
  }
}
