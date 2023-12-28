import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sportz_app/bloc/bloc/get_user_turf_bloc.dart';
import 'package:sportz_app/model.dart/user_turf_model.dart';
import 'package:sportz_app/widgets/turf_list_widget.dart';

class TurfScreen extends StatefulWidget {
  const TurfScreen({super.key});

  @override
  State<TurfScreen> createState() => _TurfScreenState();
}

class _TurfScreenState extends State<TurfScreen> {
  @override
  void initState() {
    super.initState();
    sendCurrentLocation();
  }

  void sendCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    setState(() {});
    // ignore: use_build_context_synchronously
    context.read<GetUserTurfBloc>().add(
          GetUserTurfProcess(
              longitude: position.longitude, latitude: position.latitude),
        );
  }

  List<UserTurfModel> userTurfModel = [];
  @override
  Widget build(BuildContext context) {
    return BlocListener<GetUserTurfBloc, GetUserTurfState>(
      listener: (context, state) {
        if (state is GetUserTurfSuccess) {
          userTurfModel.addAll(state.userTurfModel);
          setState(() {});
          // print(userTurfModel[0].name);
        }
      },
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              BlocBuilder<GetUserTurfBloc, GetUserTurfState>(
                builder: (context, state) {
                  if (state is GetUserTurfLoading) {
                    return Column(
                      children: [
                        Shimmer.fromColors(
                          baseColor: const Color.fromARGB(31, 220, 217, 217),
                          highlightColor: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 160,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Shimmer.fromColors(
                          baseColor: const Color.fromARGB(31, 220, 217, 217),
                          highlightColor: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 160,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Shimmer.fromColors(
                          baseColor: const Color.fromARGB(31, 220, 217, 217),
                          highlightColor: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 160,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        
                      ],
                    );
                  }
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return TurfListWidget(
                            rating: userTurfModel[index].rating,
                            id: userTurfModel[index].id,
                            name: userTurfModel[index].name,
                            location: userTurfModel[index].location,
                            amenities: userTurfModel[index].amenities,
                            price: userTurfModel[index].price,
                            image: userTurfModel[index].imageUrl,
                            description: userTurfModel[index].description,
                            fullWidth: true,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 20,
                          );
                        },
                        itemCount: userTurfModel.length),
                  );
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
