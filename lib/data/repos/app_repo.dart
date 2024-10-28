import 'package:tazkarti/data/models/ticket_model.dart';

abstract class AppRepo {
  List<TicketModel> getTicketsData();
}
