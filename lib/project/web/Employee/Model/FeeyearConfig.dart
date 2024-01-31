import 'Model.dart';

class FeeYear extends Model{
  String? year;
  String? studyFees;
  String? busFees;
  int? discountBus;
  int? discountWithoutBus;


  FeeYear({
     this.year,
     this.studyFees,
     this.busFees,
     this.discountBus,
     this.discountWithoutBus,
     id,
  }):super(id: id);

  factory FeeYear.fromJson(Map<String, dynamic> json) => FeeYear(
    year: json["year"].toString(),
    studyFees: json["study_fees"].toString(),
    busFees: json["bus_fees"].toString(),
    discountBus: json["discount_bus"],
    discountWithoutBus: json["discount_without_bus"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "year": year,
    "study_fees": studyFees,
    "bus_fees": busFees,
    "discount_bus": discountBus,
    "discount_without_bus": discountWithoutBus,
    "id": id,
  };
}
