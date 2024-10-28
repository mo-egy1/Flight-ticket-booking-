import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:tazkarti/data/models/ticket_model.dart';
import 'package:tazkarti/data/repos/app_repo.dart';
import 'package:tazkarti/view/screens/payment_successfully_screen.dart';
import 'package:tazkarti/view/screens/tickets_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit of(BuildContext context) {
    return BlocProvider.of(context);
  }

  List<String> countries = [
    'Egypt',
    'Tokyo',
    'Amsterdam',
    'London',
  ];
  List<TicketModel> resultOfSearch = [];
  findTickets(BuildContext context) {
    resultOfSearch = [];
    if (returnDate != null) {
      for (var element in ticketsDate) {
        if (element.from == from &&
            element.to == to &&
            DateFormat.yMd('en').format(departureDate!) ==
                DateFormat.yMd('en').format(element.departureDate) &&
            element.availableCount >= int.parse(countOfPassengers.text) &&
            DateFormat.yMd('en').format(returnDate!) ==
                DateFormat.yMd('en').format(element.returnDate!)) {
          resultOfSearch.add(element);
        }
      }
    } else {
      for (var element in ticketsDate) {
        if (element.from == from &&
            element.to == to &&
            DateFormat.yMd('en').format(departureDate!) ==
                DateFormat.yMd('en').format(element.departureDate) &&
            element.availableCount >= int.parse(countOfPassengers.text)) {
          resultOfSearch.add(element);
        }
      }
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TicketsScreen(),
      ),
    );
  }

  String? from;
  String? to;
  DateTime? departureDate;
  DateTime? returnDate;
  TextEditingController countOfPassengers = TextEditingController();
  onDepartureDateChanged(DateTime? date) {
    departureDate = date;
    emit(Update());
  }

  onReturnDateChanged(DateTime? date) {
    returnDate = date;
    emit(Update());
  }

  onFromCountryChanged(String? name) {
    from = name;
    emit(Update());
  }

  onToCountryChanged(String? name) {
    to = name;
    emit(Update());
  }

  List<TicketModel> ticketsDate = [];
  getTicketsData() {
    ticketsDate = [
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
  }

  static Future<void> makePayment(
      int amount, String currency, BuildContext context) async {
    try {
      String clientSecret =
          await _getClientSecret((amount * 100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PaymentSuccessfullyScreen(),
        ),
      );
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "test",
      ),
    );
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    var response = await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization':
              'Bearer sk_test_51OIUW1JIimmtSera3CdV6RFx8Z7Uv02Rqbt3nTzf0Dp2gXwTXwLAPiK9w6H4DNDbrHjB2YMh3tWNxMBASWJHIOvm00AIR4X7jm',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );
    return response.data["client_secret"];
  }

  clear() {
    from = null;
    to = null;
    departureDate = null;
    returnDate = null;
    countOfPassengers = TextEditingController();
    emit(Update());
  }
}
