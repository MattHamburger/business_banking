// import 'package:business_banking/dependency/permission_handler_plugin.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockPermissionHandler extends Mock
//     with
//         // ignore: prefer_mixin
//         MockPlatformInterfaceMixin
//     implements
//         PermissionHandlerPlatform {
//   MockPermissionHandler({this.granted = true});
//   bool granted;
//   @override
//   Future<PermissionStatus> checkPermissionStatus(Permission permission) =>
//       Future.value(
//           granted ? PermissionStatus.granted : PermissionStatus.denied);
//
//   @override
//   Future<Map<Permission, PermissionStatus>> requestPermissions(
//       List<Permission> permissions) {
//     var permissionsMap = <Permission, PermissionStatus>{};
//     return Future.value(permissionsMap);
//   }
// }
//
// void main() {
//   setUp(() {
//     PermissionHandlerPlatform.instance = MockPermissionHandler();
//   });
//   test('Check if camera permission granted', () async {
//     var status = await PermissionHandlerPlugin().isGrantedAccessCamera();
//     expect(status, true);
//   });
//
//   test('Check if no camera permission granted', () async {
//     PermissionHandlerPlatform.instance = MockPermissionHandler(granted: false);
//     var status = await PermissionHandlerPlugin().isGrantedAccessCamera();
//     expect(status, false);
//   });
// }
