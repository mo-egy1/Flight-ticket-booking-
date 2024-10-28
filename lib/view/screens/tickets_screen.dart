import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tazkarti/view/screens/checkout_screen.dart';
import 'package:tazkarti/view/screens/no_flights_scree.dart';
import 'package:tazkarti/view/widgets/custom_ticket_item.dart';
import 'package:tazkarti/view_model/cubit/app_cubit.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.blue.withOpacity(.4),
                  Colors.blue,
                  Colors.blue.withOpacity(.4),
                ])),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${AppCubit.of(context).from} - ${AppCubit.of(context).to}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 200,
                            child: Divider(color: Colors.white, thickness: .5),
                          ),
                          Text(
                            DateFormat.yMMMd('en')
                                .format(AppCubit.of(context).departureDate!)
                                .toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (AppCubit.of(context).resultOfSearch.isNotEmpty)
                ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutScreen(
                              ticketModel:
                                  AppCubit.of(context).resultOfSearch[index],
                            ),
                          ));
                    },
                    child: CustomTicketItem(
                      ticketModel: AppCubit.of(context).resultOfSearch[index],
                    ),
                  ),
                  itemCount: AppCubit.of(context).resultOfSearch.length,
                ),
              if (AppCubit.of(context).resultOfSearch.isEmpty)
                const NoFlightsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
