import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sportz_app/bloc/bloc/gallery_get_bloc.dart';
import 'package:sportz_app/model.dart/get_gallery_model.dart';
import 'package:sportz_app/screens/gallery_two_page.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<GetGalleryModel> getGallery = [];
  @override
  void initState() {
    super.initState();
    context.read<GalleryGetBloc>().add(
          const GetImageProcess(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GalleryGetBloc, GalleryGetState>(
      listener: (context, state) {
        if (state is GalleryGetSuccess) {
          print("dkhagkada ${state.getGalley}");
          getGallery.addAll(state.getGalley);
          setState(() {});
          print(getGallery);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const PhotoUploadingScreen(),
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 50),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(78, 158, 158, 158),
                        ),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Icon(Ionicons.cloud_upload_outline),
                            ),
                            SizedBox(width: 20),
                            Text('Upload Photo'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 600,
                    width: 300,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisSpacing: 20),
                      itemCount: getGallery.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 70,
                          width: 50,
                          child: Image.network(
                              'http://13.126.57.93:8000/${getGallery[index].image}'),
                        );
                      },
                    ),
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
