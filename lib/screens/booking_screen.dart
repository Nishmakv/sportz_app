import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sportz_app/bloc/bloc/get_one_turf_bloc.dart';
import 'package:sportz_app/bloc/bloc/turf_book_bloc.dart';
import 'package:sportz_app/model.dart/discount_price_model.dart';
import 'package:sportz_app/model.dart/get_turf_by_id.dart';
import 'package:sportz_app/screens/payment_screen.dart';
import 'package:time_slot/controller/day_part_controller.dart';

// ignore: must_be_immutable
class BookingScreen extends StatefulWidget {
  int id;

  BookingScreen({
    super.key,
    required this.id,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
  // ignore: library_private_types_in_public_api
  GlobalKey<_BookingScreenState> datePickerKey =
      GlobalKey<_BookingScreenState>();
}

class _BookingScreenState extends State<BookingScreen> {
  DiscountPriceModel? discountPriceModel;
  DateTime? openingTime;
  DateTime? closeTime;
  Duration? interval;
  List<String> timeSlots = [];
  DateTime now = DateTime.now();
  DateTime selectTime = DateTime.now();
  TimeOfDay? selectedTime; // pass start time
  DayPartController dayPartController = DayPartController();
  bool isCourtSelect = false;
  DateTime selectedDate = DateTime.now(); // pass selected date
  var formatter = DateFormat('yyyy-MM-dd');
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay? selectedEndTime;
  bool isclick = false;
  Duration duration = const Duration(minutes: 60);
  TimeOfDay? passendtime; // to pass endtime
  double? price;
  Key key = UniqueKey();

  void timeSlotgenerator() {
    setState(() {
      openingTime = DateTime(now.year, now.month, now.day, 6, 0, 0);
      closeTime = DateTime(now.year, now.month, now.day, 24, 0, 0);
      interval = const Duration(minutes: 60);
    });

    while (openingTime!.isBefore(closeTime!)) {
      DateTime timeIncrement = openingTime!.add(interval!);
      // Add time slots in 12-hour format
      timeSlots.add(DateFormat('h:mm a').format(timeIncrement));
      openingTime = timeIncrement;
    }
  }

  List<UserTurfByIdModel> userTurfByIdModel = [];
  @override
  void initState() {
    super.initState();
    timeSlotgenerator();
    context.read<GetOneTurfBloc>().add(
          GetOneTurfProcess(id: widget.id),
        );
  }

  void incrementDuration() {
    setState(() {
      duration = duration + const Duration(minutes: 30);
      passendtime = selectedTime!.replacing(
        hour: selectedTime!.hour + duration.inHours,
        minute: (selectedTime!.minute + duration.inMinutes) % 60,
      );
      if (userTurfByIdModel.isNotEmpty) {
        price = price! + (userTurfByIdModel[0].price / 2);
      }
    });
  }

  void decrementDuration() {
    setState(() {
      if (duration > const Duration(minutes: 60)) {
        duration = duration - const Duration(minutes: 30);
        passendtime = passendtime!.replacing(
          hour: passendtime!.hour - (const Duration(hours: 0).inHours % 24),
          minute: (passendtime!.minute -
                  (const Duration(minutes: 30).inMinutes % 60)) %
              60,
        );
        
        if (userTurfByIdModel.isNotEmpty) {
          price = price! - (userTurfByIdModel[0].price / 2);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // double totalPrice = double.parse(widget.price);

    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          confirmText: "Select",
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          key = UniqueKey();
        });
      }
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<TurfBookBloc, TurfBookState>(
          listener: (context, state) {
            if (state is TurfBookSuccess) {
              discountPriceModel = state.discountPriceModel;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => PaymentScreen(
                    id: widget.id,
                    price: price!,
                    endTime: DateFormat('HH:mm:ss ').format(
                      DateTime(now.year, now.month, now.day, passendtime!.hour,
                          passendtime!.minute, 0),
                    ),
                    discountPriceModel: discountPriceModel,
                    date: DateFormat('yyyy-MM-dd').format(selectedDate),
                    startTime: DateFormat('HH:mm:ss ').format(
                      DateTime(now.year, now.month, now.day, selectedTime!.hour,
                          selectedTime!.minute, 0),
                    ),
                  ),
                ),
              );
            } else if (state is TurfBookFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed'),
                ),
              );
            }
          },
        ),
        BlocListener<GetOneTurfBloc, GetOneTurfState>(
          listener: (context, state) {
            if (state is GetOneTurfSuccess) {
              userTurfByIdModel.addAll(state.userTurfByIdModel);
              price = userTurfByIdModel[0].price;
              setState(() {});
            } else if (state is GetOneTurfFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed'),
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
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Booking",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: BlocBuilder<GetOneTurfBloc, GetOneTurfState>(
          builder: (context, state) {
            if (state is GetOneTurfLoading) {
              const Column(
                children: [
                  Expanded(
                      child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 15, 177, 21),
                  ))
                ],
              );
            }
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: DatePicker(
                                key: key,
                                width: 55,
                                height: 90,
                                DateTime.now(),
                                daysCount: 5,
                                initialSelectedDate: selectedDate,
                                selectionColor:
                                    const Color.fromARGB(255, 15, 177, 21),
                                selectedTextColor: Colors.white,
                                onDateChange: (value) {
                                  setState(() {
                                    selectedDate = value;
                                  });
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                selectDate(context);
                              },
                              child:
                                  const Icon(Ionicons.calendar_clear_outline),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              color: Colors.white,
                              child: SizedBox(
                                height: 100,
                                width: 150,
                                child: Column(
                                  children: [
                                    const Text(
                                      "From",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    ),
                                    const SizedBox(height: 10),
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          enableDrag: true,
                                          builder: (BuildContext ctx) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: GridView.builder(
                                                itemCount: timeSlots.length,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 5,
                                                        mainAxisSpacing: 10,
                                                        crossAxisSpacing: 10),
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      setState(
                                                        () {
                                                          selectedTime = TimeOfDay
                                                              .fromDateTime(DateFormat(
                                                                      "h:mm a")
                                                                  .parse(timeSlots[
                                                                      index]));
                                                          Navigator.pop(
                                                              context);
                                                          passendtime =
                                                              selectedTime!
                                                                  .replacing(
                                                            hour: selectedTime!
                                                                    .hour +
                                                                duration
                                                                    .inHours,
                                                            minute: (selectedTime!
                                                                        .minute +
                                                                    duration
                                                                        .inMinutes) %
                                                                60,
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      color:
                                                          const Color.fromARGB(
                                                              31,
                                                              158,
                                                              158,
                                                              158),
                                                      height: 30,
                                                      width: 40,
                                                      child: Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            timeSlots[index],
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: const Icon(
                                        Ionicons.alarm_outline,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      selectedTime != null
                                          ? selectedTime!.format(context)
                                          : "--",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.white,
                              child: Container(
                                height: 80,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: GestureDetector(
                                          onTap: () {
                                            if (duration >
                                                const Duration(minutes: 60)) {
                                              decrementDuration();
                                            }
                                          },
                                          child: Icon(
                                            Ionicons.remove_circle_outline,
                                            color: duration <=
                                                    const Duration(minutes: 60)
                                                ? Colors.grey
                                                : null,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Column(
                                        children: [
                                          const Text(
                                            'Duration',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            '${duration.inMinutes} min',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          incrementDuration();
                                        },
                                        child: const Icon(
                                            Ionicons.add_circle_outline),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Text(selectedTime != null ? selectedTime.toString() : ""),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price?.toInt().toString() ?? "10" + " INR",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        // 'INR ',
                      ),
                      GestureDetector(
                        onTap: () {
                          if (selectedTime != null) {
                            context.read<TurfBookBloc>().add(
                                  TurfBookProcess(
                                      startTime: DateFormat('HH:mm:ss').format(
                                        DateTime(
                                            now.year,
                                            now.month,
                                            now.day,
                                            selectedTime!.hour,
                                            selectedTime!.minute,
                                            0),
                                      ),
                                      date: DateFormat('yyyy-MM-dd')
                                          .format(selectedDate),
                                      endTime: DateFormat('HH:mm').format(
                                        DateTime(
                                          now.year,
                                          now.month,
                                          now.day,
                                          passendtime!.hour,
                                          passendtime!.minute,
                                        ),
                                      ),
                                      price: price!),
                                );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please Select Time'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: selectedTime == null
                                ? const Color.fromARGB(63, 158, 158, 158)
                                : const Color.fromARGB(255, 15, 177, 21),
                          ),
                          child: Center(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: selectedTime == null
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
