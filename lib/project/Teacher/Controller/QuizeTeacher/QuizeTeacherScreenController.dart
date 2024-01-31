
import 'package:get/get.dart';

import '../../Model/teacherCat.dart';
import 'QuizeTeacherController.dart';




class QuizeTeacherControllerScreen extends GetxController {
  QuizeTeacherController controller  =Get.find();


  var isLoading = false;


  QuizeTeacher? Data =QuizeTeacher() ;
  QuizeTeacher? EditedData =QuizeTeacher();
  Future<void> uploadQ(text,answertexts,answerImages,correct_answer_symbol,audio,category_id) async {

    isLoading = true;
    update();
    await controller.uploadQ(text,answertexts,answerImages,correct_answer_symbol,audio,category_id);
    isLoading = false;
    update();
  }
  Future<void> EditQ(text,answertexts,answerImages,correct_answer_symbol,audio,category_id) async {

    isLoading = true;
    update();
    await controller.EditQ(text,answertexts,answerImages,correct_answer_symbol,audio,category_id);
    isLoading = false;
    update();
  }

}
