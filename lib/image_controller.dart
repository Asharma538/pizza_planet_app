import 'package:get/get.dart';
import 'package:pizza_planet/firebase_storage_services.dart';

class imageController extends GetxController {
  final allImagesPizza = <String>[].obs;
  final allImagesBurger = <String>[].obs;
  final allImagesBreads = <String>[].obs;
  @override
  void onReady() {
    getAllImages();
    super.onReady();
  }

  Future<void> getAllImages() async {
    List<String> imgNamePizza = [
      "pizza_image0.png",
      "pizza_image1.png",
      "pizza_image2.png",
      "pizza_image3.png",
      "pizza_image4.png",
      "pizza_image5.png",
      "pizza_image6.png",
      "pizza_image7.png",
      "pizza_image8.png",
      "pizza_image9.png",
    ];
    List<String> imgNameBurger = [
      "burger_carousel1.jpeg",
      "burger_carousel2.jpeg",
      "burger_carousel3.jpeg",
      "burger_carousel4.jpeg",
      "burger_carousel5.jpeg",
    ];
    List<String> imgNameBread = [
      "garlic_breads0.jpg",
      "garlic_breads1.jpg",
      "garlic_breads2.jpg",
      "garlic_breads3.jpg",
    ];
    Get.lazyPut(() => FirebaseStorageService());
    try {
      for (var img in imgNameBurger) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img, "burger");
        allImagesBurger.add(imgUrl!);
      }
      for (var img in imgNameBread) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img, "garlicBread");
        allImagesBreads.add(imgUrl!);
      }
      for (var img in imgNamePizza) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img, "pizza");
        allImagesPizza.add(imgUrl!);
      }
    } catch (e) {
      print(e);
    }
  }
}
