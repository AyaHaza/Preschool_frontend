import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => MaterialApp(
     home: Scaffold(
       body: ElevatedButton(onPressed: ()=>prepareJar(), child: Container(width: 20,height: 20,),),
     ),
      );
  static Future<void> prepareJar() async {
    // var picked = await FilePicker.platform.pickFiles();
    //
    // if (picked != null) {
    //   print(picked.files.first.name);
    //   var fileBytes = picked.files.first.bytes;
    //     print(picked.files.first.path);
    //   // final Directory appDocDir = result.files.first.path;
    //   final String? appDocPath = picked.files.first.path;
    //
    // }
    FilePickerResult? result;

    try{
      result = await FilePicker.platform.pickFiles();
    } catch(e)
    { print(e);
    }

    if(result != null) {
      try{

        Uint8List? uploadfile = result.files.single.bytes;
        String filename = basename(result.files.single.name);
          print(  result.files.single.path);

      }catch(e) {
        print(e);
      }

    }
  }

}
