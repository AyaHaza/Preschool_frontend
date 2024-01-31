
import 'package:get/get.dart';
import '../../Model/AlllCategory.dart';
import 'categoryController.dart';



class catControllerScreen extends GetxController {
  CatController controller  =Get.put(CatController());

  var isLoading = false;


  AllCategories? Data =AllCategories() ;
  AllCategories? EditedData =AllCategories();

  Future<void> upload(name,img) async {

    isLoading = true;
    update();
    await controller.upload(name,img);
    isLoading = false;
    update();
  }
  Future<void> EditFile(name,img,id) async {

    isLoading = true;
    update();
    await controller.EditFile(name,img,id);
    isLoading = false;
    update();
  }



}
