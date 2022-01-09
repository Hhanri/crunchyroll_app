import 'package:crunchyroll_app/controller/view_screen_controller.dart';
import 'package:get/get.dart';

class ViewScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ViewScreenController>(() => ViewScreenController());
  }

}