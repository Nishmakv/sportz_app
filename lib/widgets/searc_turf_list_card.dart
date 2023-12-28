import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:shimmer/shimmer.dart';
import 'package:sportz_app/bloc/bloc/search_turf_name_bloc.dart';
import '../model.dart/search_turf_name_model.dart';
import 'search_turf_list_widget.dart';

// ignore: must_be_immutable
class SearchTurfListCard extends StatefulWidget {
  // List<SearchTurfModel> searchTurfModel = [];
  const SearchTurfListCard({super.key});

  @override
  State<SearchTurfListCard> createState() => _TurfListCardState();
}

class _TurfListCardState extends State<SearchTurfListCard> {
  List<SearchTurfModel> searchTurfModel = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchTurfNameBloc, SearchTurfNameState>(
      listener: (context, state) {
        if (state is SearchTurfNameSuccess) {
          searchTurfModel = state.searchTurfModel;
        } else if (state is SearchTurfNameFailure) {}
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
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
                                    Icon(Ionicons.chevron_back_outline, size: 22))),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "Search",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(height: 15,),
                  BlocBuilder<SearchTurfNameBloc, SearchTurfNameState>(
                      builder: (context, state) {
                    if (state is SearchTurfNameLoading) {
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
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 500,
                          child: searchTurfModel.isNotEmpty
                              ? ListView.separated(
                                  itemCount: searchTurfModel.length,
                                  primary: false,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return SearchTurfListWidget(
                                      rating: searchTurfModel[index].aiRating,
                                      id: searchTurfModel[index].id,
                                      location: searchTurfModel[index].location,
                                      name: searchTurfModel[index].name,
                                      amenities: [searchTurfModel[index].amenity],
                                      price: searchTurfModel[index].price,
                                      image: searchTurfModel[index].image,
                                      description:
                                          searchTurfModel[index].description,
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
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
