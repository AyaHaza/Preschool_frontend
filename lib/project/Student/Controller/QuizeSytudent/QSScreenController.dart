
import 'package:get/get.dart';

import '../../Model/QuizeStudent.dart';
import 'QSController.dart';




class QSControllerScreen extends GetxController {
  QSController controller  =Get.find();

  var isLoading = false;


  QuizeStudent? Data =QuizeStudent() ;
  QuizeStudent? EditedData =QuizeStudent();



}
