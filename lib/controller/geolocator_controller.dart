

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GeolocatorController extends GetxController {
  // Getx Controller sayesinde dynamic şekilde işlemler gerçekleşecek!!
  // Get paketi sayesinde pratik ve kolay bir şekilde işlem yapabilirsiniz.

  bool isLoadingFinish = false;
  bool isRequiredPermission = false;
  Position? currentLocation;
  Future<Position?> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();  //konum izninin alınıp alınmadığını kontrol ettik.
    if (permission == LocationPermission.denied) {  // eğer konum izni reddedildiyse işlem yapamayız
      return null;
    }
    return await Geolocator.getCurrentPosition( // konum bilgilerini alıyoruz
            desiredAccuracy: LocationAccuracy.high)
        .catchError((e) => print('error $e'));   // hata oluşursa hata mesajını ekrana yazdırıyoruz
  }

  void permissionOK() {  // konum izni verildiğinde işlem yapılacak
    getLocation().then((value) { 
      
        currentLocation = value!;
        isLoadingFinish = true;
        if(value == null) { 
          isRequiredPermission = true;
        } else {
          isRequiredPermission = false;
        }
        
      
        
      
    });
  }
}
