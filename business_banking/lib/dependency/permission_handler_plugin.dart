import 'package:clean_framework/clean_framework.dart';

// import 'package:permission_handler/permission_handler.dart';
//
class PermissionHandlerPlugin extends ExternalDependency {
  Future<bool> isGrantedAccessCamera() async {
    return false;
    // var status = await Permission.camera.status;
    // if (status.isGranted) {
    //   return true;
    // } else {
    //   var reqStatus = await Permission.camera.request();
    //   return reqStatus.isGranted;
    // }
  }
}
