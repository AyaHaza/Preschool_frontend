
import 'package:get/get.dart';
import '../../Model/StudentFee.dart';
import '../../Model/StudentsFee.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import '../../Controller/Advertisement/Management/apis.dart';
class FeeController extends GetxController{



  Map<int ,Fee>StudentFee ={};

  Map<int ,Fees>PaidStudentFee ={};
  Map<int ,Fees>CompleteStudentFee ={};
  Map<int ,Fees>LateStudentFee ={};
  Map<int ,Fees>ALLStudentFee ={};

  Map<int ,Fees>StudentFeepage ={};

  String amount="";
  String student_id="";

  static const StoreEndpoint = "${AuthNetwork.baseUrl}/studentFees/store";
  static const StudentFetchEndpoint = "${AuthNetwork.baseUrl}/studentFees";
  static const StudentFetchPaidEndpoint = "${AuthNetwork.baseUrl}/paided/studentFees";
  static const StudentFetchcompleteEndpoint = "${AuthNetwork.baseUrl}/complete/studentFees";
  static const StudentFetchLateEndpoint = "${AuthNetwork.baseUrl}/latePaymentStudents/studentFees";
  static const StudentFetchAllEndpoint = "${AuthNetwork.baseUrl}/allStudent/studentFees";

  @override
  Future<void> onInit() async {
    await FetchStudentpaided();
    await FetchStudentAll();
    await FetchStudentComplete();
    await FetchStudentLate();
    super.onInit();
  }

void set(Map<int ,Fees>fee)async{

StudentFeepage=fee;
  update();
}
  Future<void> Store(Fee fee) async {
    try {
      amount="";
      student_id="";

      final responseData = await Network.Store(fee,StoreEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('amount')) {
          amount = responseData['amount'].toString();
        }
        if(responseData.containsKey('student_id')) {
          student_id = responseData['student_id'].toString();
        }
        if(responseData.containsKey('data')) {
          throw responseData['data'].toString();
        }
        return;
      }
      update();

      Dialogs.Success("Added Successfully!");
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! < $e>");
    }
  }
  Future<void> FetchStudentFee(int id) async {
    try {
      final responseData = await Network.fetch("$StudentFetchEndpoint/$id");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw responseData['data'].toString();
      }
      StudentFee.clear();
      responseData['data'].forEach((value) {
        Fee fee=Fee.fromJson(value);
        StudentFee.addAll({fee.id! : fee });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
  Future<void> FetchStudentpaided() async {
    try {
      final responseData = await Network.fetch("$StudentFetchPaidEndpoint");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw responseData['data'].toString();
      }
      PaidStudentFee.clear();
      responseData['data'].forEach((value) {
        Fees fee=Fees.fromJson(value);
        PaidStudentFee.addAll({fee.id! : fee });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
  Future<void> FetchStudentComplete() async {
    try {
      final responseData = await Network.fetch("$StudentFetchcompleteEndpoint");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw responseData['data'].toString();
      }
      CompleteStudentFee.clear();
      responseData['data'].forEach((value) {
        Fees fee=Fees.fromJson(value);
        CompleteStudentFee.addAll({fee.id! : fee });
      });
      update();
    }  catch (e) {
      print(e);
      // Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
  Future<void> FetchStudentAll() async {
    try {
      final responseData = await Network.fetch("$StudentFetchAllEndpoint");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw responseData['data'].toString();
      }
      ALLStudentFee.clear();
      responseData['data'].forEach((value) {
        Fees fee=Fees.fromJson(value);
        ALLStudentFee.addAll({fee.id! : fee });
      });
      update();
    }  catch (e) {
      print(e);
      // Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
  Future<void> FetchStudentLate() async {
    try {
      final responseData = await Network.fetch("$StudentFetchLateEndpoint");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw responseData['data'].toString();
      }
      LateStudentFee.clear();
      responseData['data'].forEach((value) {
        Fees fee=Fees.fromJson(value);
        LateStudentFee.addAll({fee.id! : fee });
      });
      update();
    }  catch (e) {
      print(e);
      // Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
}