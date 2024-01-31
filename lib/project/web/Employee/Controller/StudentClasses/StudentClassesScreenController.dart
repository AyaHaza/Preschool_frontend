
import 'package:get/get.dart';

import '../../Model/StudentClasses.dart';



class StudentControllerScreenController extends GetxController {
  StudentClasses controller  =Get.find();

  var isLoading = false;


  StudentClasses? Data =StudentClasses() ;
  StudentClasses? EditedData =StudentClasses();

  Future<void> Store() async {

    isLoading = true;
    update();
//    await controller.Store(Data!);




    isLoading = false;
    update();
  }

  Future<void> Edit(int id) async {
    //  print('dddddddddddddddddddddddddddddddddddddffffffffff');

    isLoading = true;
    EditedData!.id=id;
    update();


    isLoading = false;
    update();
  }

}
