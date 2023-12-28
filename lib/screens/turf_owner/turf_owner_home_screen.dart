import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sportz_app/bloc/bloc/delete_turf_bloc.dart';
import 'package:sportz_app/bloc/bloc/get_turf_bloc.dart';
import 'package:sportz_app/model.dart/turf_model.dart';
import 'package:sportz_app/screens/turf_owner/turf_location_screen.dart';
import 'package:sportz_app/widgets/button.dart';

class TurfOwnerHome extends StatefulWidget {
  const TurfOwnerHome({super.key});

  @override
  State<TurfOwnerHome> createState() => _TurfOwnerHomeState();
}

class _TurfOwnerHomeState extends State<TurfOwnerHome> {
  List<TurfModel> turfModel = [];
  @override
  void initState() {
    super.initState();
    context.read<GetTurfBloc>().add(
          const GetTurfProcess(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<GetTurfBloc, GetTurfState>(
          listener: (context, state) {
            if (state is GetTurfSuccess) {
              turfModel.addAll(state.turfModel);
            }
          },
        ),
        BlocListener<DeleteTurfBloc, DeleteTurfState>(
          listener: (context, state) {
            if (state is DeleteTurfSuccess) {
              context.read<GetTurfBloc>().add(
                    const GetTurfProcess(),
                  );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Turf deleted successfully'),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Turf deletion failed'),
                ),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Button(
                    text: 'Add Turf',
                    onClick: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: MapScreen(),
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                ),
                ListView.builder(
                  itemCount: turfModel.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.network(
                                  turfModel[index].image,
                                ),
                                Positioned(
                                  top: 10,
                                  left: 250,
                                  child: Row(
                                    children: [
                                      const Icon(Ionicons.create),
                                      const SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: const Text(
                                                  'Are you sure?',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                actions: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: 60,
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.amber,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                        ),
                                                        child: Center(
                                                            child:
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      context
                                                                          .read<
                                                                              DeleteTurfBloc>()
                                                                          .add(
                                                                            DeleteTurfProcess(id: turfModel[index].id),
                                                                          );
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Text(
                                                                        'Yes'))),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Container(
                                                        width: 60,
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.amber,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                        ),
                                                        child: Center(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text('No'),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Icon(Ionicons.trash),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  turfModel[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(turfModel[index].price),
                              ],
                            ),
                            Text(turfModel[index].location),
                            Text(turfModel[index].description),
                            //  Text(turfModel[index].amenity),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
