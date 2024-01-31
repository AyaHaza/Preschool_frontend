
import 'package:get/get.dart';
import '../../Model/Bus.dart';
import '../../Model/BusSuoerVisor.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../view/BusMangement/BusAll/BusAll.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class BusController extends GetxController{

  Map<int ,BusVisor>BusesuperV ={};
  Map<int ,Bus>Buses ={};

  String capacityMsg="";
  String numberMsg="";
  String bus_supervisor_idMsg="";


  // supervisors

  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();
    await Fetch1();
  }

  static const authEndpoint = "${AuthNetwork.baseUrl}/buses";
  

  Future<void> Store(Bus class1) async {
    try {
        capacityMsg="";
   numberMsg="";
   bus_supervisor_idMsg="";
   
      final responseData = await Network.Store(class1,'${authEndpoint}/store');
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('capacity')) {
          capacityMsg = responseData['capacity'][0].toString();
        }
        if(responseData.containsKey('number')) {
          numberMsg = responseData['number'][0].toString();
        }
        if(responseData.containsKey('bus_supervisor_id')) {
          bus_supervisor_idMsg = responseData['bus_supervisor_id'][0].toString();
        }
        if(responseData.containsKey('data')) {
          bus_supervisor_idMsg = responseData['data'].toString();
        }

        return;
      }
       print(responseData['data']);
      Bus class2=Bus.fromJson(responseData['data']);
      Buses.addAll({class2.id! : class2 });
      update();
      Dialogs.Success("Added Successfully!");
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! < $e>");
    }
  }
  Future<void> Fetch() async {
    try {
      print("Busssss Fetch");
      final responseData = await Network.fetch(authEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      print(responseData['data']);
      Buses.clear();
      responseData['data'].forEach((value) {
        Bus class1=Bus.fromJson(value);
        Buses.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
  Future<void> Fetch1() async {
    try {
      final responseData = await Network.fetch("${AuthNetwork.baseUrl}/supervisors");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      print(responseData['data']);
      BusesuperV.clear();
      responseData['data'].forEach((value) {
        BusVisor class1=BusVisor.fromJson(value);
        BusesuperV.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }


  Future<void> Edit(Bus EditedData) async {
   capacityMsg="";
   numberMsg="";
   bus_supervisor_idMsg="";
   
    try {
      final responseData = await Network.Store(EditedData,'${authEndpoint}/${EditedData.id}');

     if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('capacity')) {
          capacityMsg = responseData['capacity'].toString();
        }
        if(responseData.containsKey('number')) {
          numberMsg = responseData['number'].toString();
        }
        if(responseData.containsKey('bus_supervisor_id')) {
          bus_supervisor_idMsg = responseData['bus_supervisor_id'].toString();
        }
        if(responseData.containsKey('data')) {
          bus_supervisor_idMsg = responseData['data'].toString();
        }

        return;
      }
      Buses[EditedData.id]!.capacity=EditedData.capacity;
      Buses[EditedData.id]!.number=EditedData.number;
      Buses[EditedData.id]!.bus_supervisor_id=EditedData.bus_supervisor_id;
     

      update();
      Dialogs.SuccessEdit("Updated Successfully!",BusManagemet.routeName);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
 
  Future<void> Delete(int id) async {
    try {
      final responseData = await Network.Delete(id,"$authEndpoint");

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      Buses.remove(id);
      update();
      Dialogs.Success(responseData['data']);

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }


}