import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tazkarti/data/models/ticket_model.dart';
import 'package:tazkarti/view/screens/payment_successfully_screen.dart';
import 'package:tazkarti/view/widgets/custom_ticket_item.dart';
import 'package:tazkarti/view_model/cubit/app_cubit.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({
    super.key,
    required this.ticketModel,
  });
  TicketModel ticketModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.blue.withOpacity(.4),
                        Colors.blue,
                        Colors.blue.withOpacity(.4),
                      ]),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 1,
                      right: 1,
                      bottom: 1,
                      top: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.flight,
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
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  DateFormat.yMMMd('en')
                                      .format(
                                          AppCubit.of(context).departureDate!)
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.grey.withOpacity(.6),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTicketItem(
                ticketModel: ticketModel,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    const CustomPassengerDataForm(),
                itemCount:
                    int.parse(AppCubit.of(context).countOfPassengers.text),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Colors.blue,
                          ),
                        ),
                        onPressed: () async {
                          await AppCubit.makePayment(
                              int.parse(AppCubit.of(context)
                                      .countOfPassengers
                                      .text) *
                                  ticketModel.price,
                              'USD',context);
                          // ignore: use_build_context_synchronously
                        
                        },
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomPassengerDataForm extends StatelessWidget {
  const CustomPassengerDataForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(
            right: 1,
            left: 1,
            bottom: 1,
            top: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Passengers',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Surname',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(
                          .6,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(
                          .6,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Gender',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(
                          .6,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Date of birth',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(
                          .6,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Document',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(
                          .6,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Series and number',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(
                          .6,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Expiration date',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(
                          .6,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
