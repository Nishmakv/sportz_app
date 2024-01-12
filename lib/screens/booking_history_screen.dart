import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sportz_app/bloc/bloc/booking_history_bloc.dart';

import '../model.dart/booking_history_model.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({super.key});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  List<BookingHistoryModel> bookingHistoryModel = [];
  @override
  void initState() {
    super.initState();
    context.read<BookingHistoryBloc>().add(
          const BookingHistoryProcess(),
        );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocListener<BookingHistoryBloc, BookingHistoryState>(
      listener: (context, state) {
        if (state is BookingHistorySuccess) {
          bookingHistoryModel = state.bookingHistoryModel;
          setState(() {});
        }
      },
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => {Navigator.of(context).pop()},
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child:
                                Icon(Ionicons.chevron_back_outline, size: 22),
                                ),
                                ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    "Your Bookings",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
              bookingHistoryModel.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: bookingHistoryModel.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            child: ListTile(
                              title: Text(
                                  'User: ${bookingHistoryModel[index].userName}'),
                              subtitle: Text(
                                  'Date: ${bookingHistoryModel[index].dateBooked.toString()}'),
                            ),
                          );
                        },
                      ),
                    )
                  : Expanded(
                      child: Center(
                        child: Text(
                          "No Orders yet",
                          style: TextStyle(
                              fontSize: width * 0.048,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
            ],
          ),
        )),
      ),
    );
  }
}
