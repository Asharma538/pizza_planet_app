import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:pizza_planet/firebase_storage_services.dart';

class imageController extends GetxController {
  final allImages = <String>[].obs;
  @override
  void onReady() {
    getAllImages();
    super.onReady();
  }

  Future<void> getAllImages() async {
    List<String> imgName = [
      "bread_carousel",
      "bread_carousel0",
      "bread_carousel1",
      "bread_carousel2",
      "bread_carousel3",
      "bread_carousel4",
      "bread_carousel5",
      "bread_carousel6",
      "bread_carousel8",
      "bread_carousel9",
    ];
    try {
      for (var img in imgName) {
        Get.lazyPut(() => FirebaseStorageService());
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img , "carouselImages" );
        allImages.add(imgUrl!);
      }
    } catch (e) {
      print(e);
    }
    // print(allImages);
  }
}
