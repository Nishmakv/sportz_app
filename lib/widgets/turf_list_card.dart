import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportz_app/bloc/bloc/get_user_turf_bloc.dart';
import 'package:sportz_app/model.dart/user_turf_model.dart';
import 'package:sportz_app/widgets/turf_list_widget.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class TurfListCard extends StatefulWidget {
  final bool count;

  const TurfListCard({super.key, required this.count});

  @override
  State<TurfListCard> createState() => _TurfListCardState();
}

class _TurfListCardState extends State<TurfListCard> {
  List<UserTurfModel> userTurfModel = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetUserTurfBloc, GetUserTurfState>(
      listener: (context, state) {
        print("stttateee $state");
        if (state is GetUserTurfSuccess) {
          userTurfModel.addAll(state.userTurfModel);
          setState(() {});
          // print(userTurfModel[0].name);
        }
      },
      child: BlocBuilder<GetUserTurfBloc, GetUserTurfState>(
        builder: (context, state) {
          if (state is GetUserTurfLoading) {
            return Shimmer.fromColors(
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
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: widget.count == false ? 275 : 500,
                  child: userTurfModel.isNotEmpty
                      ? ListView.separated(
                          itemCount:
                              widget.count == false ? 4 : userTurfModel.length,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: widget.count == false
                              ? Axis.horizontal
                              : Axis.vertical,
                          itemBuilder: (context, index) {
                            return TurfListWidget(
                              id: userTurfModel[index].id,
                              name: userTurfModel[index].name,
                              location: userTurfModel[index].location,
                              amenities: userTurfModel[index].amenities,
                              price: userTurfModel[index].price,
                              image: userTurfModel[index].imageUrl,
                              description: userTurfModel[index].description,
                              rating: userTurfModel[index].rating,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 20,
                            );
                          },
                        )
                      : const Center(
                          child: Text('No Turf Available'),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
