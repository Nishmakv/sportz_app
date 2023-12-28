import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sportz_app/bloc/bloc/booking_success_bloc.dart';
import 'package:sportz_app/bloc/bloc/get_one_turf_bloc.dart';
import 'package:sportz_app/model.dart/discount_price_model.dart';
import 'package:sportz_app/model.dart/get_turf_by_id.dart';
import 'package:sportz_app/screens/booking_success_screen.dart';
import 'package:sportz_app/widgets/button.dart';

// ignore: must_be_immutable
class PaymentScreen extends StatefulWidget {
  final DiscountPriceModel? discountPriceModel;
  int id;
  double price;
  String date;
  String startTime;
  String endTime;
  PaymentScreen(
      {super.key,
      required this.id,
      required this.price,
      required this.date,
      required this.startTime,
      required this.endTime,
      this.discountPriceModel});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<UserTurfByIdModel> userTurfByIdModel = [];
  DiscountPriceModel? discountPriceModel;
  @override
  void initState() {
    super.initState();
    context.read<GetOneTurfBloc>().add(
          GetOneTurfProcess(id: widget.id),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<GetOneTurfBloc, GetOneTurfState>(
          listener: (context, state) {
            if (state is GetOneTurfSuccess) {
              userTurfByIdModel.addAll(state.userTurfByIdModel);
              setState(() {});
            }
          },
        ),
        BlocListener<BookingSuccessBloc, BookingSuccessState>(
          listener: (context, state) {
            if (state is BookingSuccessSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const BookingSuccessScreen(),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const BookingSuccessScreen(),
                ),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Ionicons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Booking',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                children: [
                  BlocBuilder<GetOneTurfBloc, GetOneTurfState>(
                    builder: (context, state) {
                      if (state is GetOneTurfLoading) {
                        return const CircularProgressIndicator();
                      }
                      return Container(
                        width: 200,
                        child: Column(
                          children: [
                            userTurfByIdModel.isNotEmpty
                                ? Image.network(userTurfByIdModel[0].image)
                                : Image.asset("assets/images/placeholder.png"),
                            const SizedBox(height: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userTurfByIdModel.isNotEmpty
                                      ? userTurfByIdModel[0].name
                                      : "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  userTurfByIdModel[0].location,
                                  style: const TextStyle(
                                    color: Color.fromARGB(142, 0, 0, 0),
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 80),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Cash On Delivery',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Offer Discount'),
                          Text(
                            widget.discountPriceModel?.discountAmount == null
                                ? '100'
                                : '${widget.discountPriceModel?.discountAmount.toString()}',
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Final Amount'),
                          Text((widget.price.toInt() -
                                  (discountPriceModel?.discountAmount ?? 0))
                              .toString()),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Button(
                        text: "Book Now",
                        onClick: () {
                          context.read<BookingSuccessBloc>().add(
                                BookingSuccessProcess(
                                    id: widget.id,
                                    startTime: widget.startTime,
                                    date: widget.date,
                                    endTime: widget.endTime,
                                    price: widget.price),
                              );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
