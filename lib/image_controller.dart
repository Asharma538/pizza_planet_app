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
      "barbeque_chicken_pizza.png",
      "chef's_veg_special.png",
      "chicken_feast_pizza.png",
      "chicken_supreme_pizza.png",
      "double_cheese_margherita.png",
      "fresh_veggie.png",
      "maxican_green_wave.png",
      "paneer_special_pizza.png",
      "paprika_paneer_pizza.png",
      "pizza_planet_special.png",
    ];
    List<String> imgNameBurger = [
      "aloo_tikki_burger.png",
      "chicken_burger.png",
      "double_chicken_burger.png",
      "herb_tikki_burger.png",
      "veggie_king_burger.png",
    ];
    List<String> imgNameBread = [
      "calzone_pocket.png",
      "stuffed_garlic_bread.png",
      "garlic_bread_sticks.png",
      "cheesy_dip.png",
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
