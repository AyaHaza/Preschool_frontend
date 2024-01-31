
import 'package:get/get.dart';

import '../../Model/FeeyearConfig.dart';
import 'ConfigController.dart';
import 'FeeConfigController.dart';
class FeeConfigControllerScreen extends GetxController {
  FeeConfigController controller  =Get.find();
  @override
  void onInit() async {
    await controller.Fetch();
    super.onInit();
  }

  var isLoading = false;

  FeeYear? FeeData=FeeYear();
  FeeYear? EditedFeeData=FeeYear();

  String? Year="";
  String? study_fees="";
  String? bus_fees="";
  String? discount_bus="";
  String? discount_without_bus="";

  Future<void> Store() async {
    Year="";
    study_fees="";
    bus_fees="";
    discount_bus="";
    discount_without_bus="";
    isLoading = true;
    update();
    await controller.Store(FeeData!);
    Year=controller.Year;
    study_fees=controller.study_fees;
    bus_fees=controller.bus_fees;
    discount_bus=controller.discount_bus;
    discount_without_bus=controller.discount_without_bus;
    isLoading = false;
    update();
  }
  //
  Future<void> Edit(int id) async {
    Year="";
    study_fees="";
    bus_fees="";
    discount_bus="";
    discount_without_bus="";
    isLoading = true;
    EditedFeeData!.id=id;
    update();
     await controller.Edit(EditedFeeData!);
    Year=controller.Year;
    study_fees=controller.study_fees;
    bus_fees=controller.bus_fees;
    discount_bus=controller.discount_bus;
    discount_without_bus=controller.discount_without_bus;

    isLoading = false;
    update();
  }

}
