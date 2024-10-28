import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tazkarti/core/assets_manager.dart';
import 'package:tazkarti/view/screens/home_screen.dart';
import 'package:tazkarti/view_model/cubit/app_cubit.dart';

class PaymentSuccessfullyScreen extends StatelessWidget {
  const PaymentSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              const Text(
                '𝑷𝑨𝒀𝑴𝑬𝑵𝑻 𝑺𝑼𝑪𝑪𝑬𝑺𝑺𝑭𝑼𝑳𝑳𝒀 𝑪𝑶𝑴𝑷𝑳𝑬𝑻𝑬𝑫',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Lottie.asset(
                AssetsManager.paymentSuccess,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Colors.amber,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                            (route) => false,
                          );
                          AppCubit.of(context).clear();
                        },
                        child: const Text(
                          'Find Other Flights',
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
