
import 'package:get/get.dart';

import '../../Model/Bus.dart';
import 'BusController.dart';


class BusControllerScreen extends GetxController {
  BusController controller  =Get.find();

  var isLoading = false;
String capacityMsg="";
  String numberMsg="";
  String bus_supervisor_idMsg="";

  Bus? Data =Bus() ;
  Bus? EditedData =Bus();

  Future<void> Store() async {
   capacityMsg="";
   numberMsg="";
   bus_supervisor_idMsg="";
    isLoading = true;
    update();
    await controller.Store(Data!);
     capacityMsg = controller.capacityMsg;
    numberMsg = controller.numberMsg;
   bus_supervisor_idMsg = controller.bus_supervisor_idMsg;

  
   
    isLoading = false;
    update();
  }
  
  Future<void> Edit(int id) async {
    capacityMsg="";
   numberMsg="";
   bus_supervisor_idMsg="";
    isLoading = true;
    EditedData!.id=id;
    update();
    // if(EditedData!.levelId==null)
    //   EditedData!.levelId=controller.Classes[id]!.levelId!;
    if( EditedData!.capacity!.compareTo(controller.Buses[id]!.capacity!)!=0 ||
        EditedData!.number!.compareTo(controller.Buses[id]!.number!)!=0
    || EditedData!.bus_supervisor_id!.compareTo(controller.Buses[id]!.bus_supervisor_id!)!=0 
   
    ){
       await controller.Edit(EditedData!);
     }
    capacityMsg = controller.capacityMsg;
    numberMsg = controller.numberMsg;
   bus_supervisor_idMsg = controller.bus_supervisor_idMsg;
 
    isLoading = false;
    update();
  }

}
