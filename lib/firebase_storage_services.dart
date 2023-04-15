import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

Reference get firebaseStorage => FirebaseStorage.instance.ref();

class FirebaseStorageService extends GetxService {
  getImage(String? imgName) async{
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage
          .child("carouselImages")
          .child('${imgName.toLowerCase()}.jpeg');
          var imgUrl = await urlRef.getDownloadURL();
          return imgUrl;
    } catch (e) {
      return null;
    }
  }
}
