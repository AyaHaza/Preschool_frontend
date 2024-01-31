
import 'package:get/get.dart';
import '../../Model/AlllCategory.dart';
import 'EaxmsController.dart';



class examsControllerScreen extends GetxController {
  ExamConrtroller controller  =Get.find();

  var isLoading = false;


  AllCategories? Data =AllCategories() ;
  AllCategories? EditedData =AllCategories();


  Future<void> upload(ppuplishDate,statuss,term,type,datee,file) async {

    isLoading = true;
    update();
    await controller.upload(ppuplishDate,statuss,term,type,datee,file);
    isLoading = false;
    update();
  }
  Future<void> EditFile(ppuplishDate,statuss,term,type,datee,file) async {

    isLoading = true;
    update();
    await controller.EditFile(ppuplishDate,statuss,term,type,datee,file);
    isLoading = false;
    update();
  }



}
