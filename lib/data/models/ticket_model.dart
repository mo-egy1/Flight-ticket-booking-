class TicketModel {
  int id;
  String from;
  String to;
  String airLineComapnyName;
  int price;
  DateTime departureDate;
  DateTime? returnDate;
  DateTime arrivalDate;
  double rate;
  int availableCount;
  TicketModel({
    required this.id,
    required this.from,
    required this.to,
    required this.departureDate,
    required this.arrivalDate,
    required this.returnDate,
    required this.airLineComapnyName,
    required this.rate,
    required this.price,
    required this.availableCount,
  });
}
