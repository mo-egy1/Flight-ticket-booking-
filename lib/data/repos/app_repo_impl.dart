import 'package:tazkarti/data/models/ticket_model.dart';
import 'package:tazkarti/data/repos/app_repo.dart';

class AppRepoImpl implements AppRepo {
  @override
  List<TicketModel> getTicketsData() {
    List<TicketModel> date = [];
    date = [
      TicketModel(
        id: 1,
        from: "Egypt",
        to: "Tokyo",
        departureDate: DateTime(2023, 12, 15, 22, 25),
        arrivalDate: DateTime(2023, 12, 16, 2, 55),
        returnDate: DateTime(2023, 12, 20, 12, 35),
        airLineComapnyName: 'Emirates Airline',
        availableCount: 2,
        rate: 9.8,
        price: 10000,
      ),
      TicketModel(
        id: 2,
        from: "Tokyo",
        to: "Egypt",
        departureDate: DateTime(2023, 12, 15, 22, 25),
        arrivalDate: DateTime(2023, 12, 16, 2, 55),
        returnDate: DateTime(2023, 12, 20, 12, 35),
        airLineComapnyName: 'Emirates Airline',
        availableCount: 1,
        rate: 7.8,
        price: 13000,
      ),
      TicketModel(
        id: 1,
        from: "Egypt",
        to: "Tokyo",
        departureDate: DateTime(2023, 12, 15, 22, 25),
        arrivalDate: DateTime(2023, 12, 16, 7, 55),
        returnDate: DateTime(2023, 12, 20, 23, 35),
        airLineComapnyName: 'Egypt Airline',
        availableCount: 7,
        rate: 8.8,
        price: 17000,
      ),
      TicketModel(
        id: 2,
        from: "Tokyo",
        to: "Egypt",
        departureDate: DateTime(2023, 12, 15, 22, 25),
        arrivalDate: DateTime(2023, 12, 16, 7, 55),
        returnDate: DateTime(2023, 12, 20, 1, 35),
        airLineComapnyName: 'Egypt Airline',
        availableCount: 10,
        rate: 15.8,
        price: 14000,
      ),
    ];
    return date;
  }
}
