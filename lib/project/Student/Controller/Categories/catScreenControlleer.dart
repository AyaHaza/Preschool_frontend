
import 'package:get/get.dart';
import '../../Model/AlllCategory.dart';
import 'categoryController.dart';



class catControllerScreen extends GetxController {
  CatController controller  =Get.find();

  var isLoading = false;


  AllCategories? Data =AllCategories() ;
  AllCategories? EditedData =AllCategories();

  Future<void> Store() async {

    isLoading = true;
    update();
    await controller.Store(Data!);
    isLoading = false;
    update();
  }

  // Future<void> Edit(int id) async {
  // //  print('dddddddddddddddddddddddddddddddddddddffffffffff');
  //   capacityMsg="";
  //  numberMsg="";
  //  bus_supervisor_idMsg="";
  //   isLoading = true;
  //   EditedData!.id=id;
  //   update();
  //   // if(EditedData!.levelId==null)
  //   //   EditedData!.levelId=controller.Classes[id]!.levelId!;
  //   if( EditedData!.capacity!.compareTo(controller.Buses[id]!.capacity!)!=0 ||
  //       EditedData!.number!.compareTo(controller.Buses[id]!.number!)!=0
  //   || EditedData!.bus_supervisor_id!.compareTo(controller.Buses[id]!.bus_supervisor_id!)!=0

  //   ){
  //     print('{editDtaa}${EditedData}');
  //      await controller.EditEmp(EditedData!);
  //    }
  //   capacityMsg = controller.capacityMsg;
  //   numberMsg = controller.numberMsg;
  //  bus_supervisor_idMsg = controller.bus_supervisor_idMsg;

  //   isLoading = false;
  //   update();
  // }

}
