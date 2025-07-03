import 'package:get/get.dart';
import 'package:pengen_chat/common/ui/snackbar_helper.dart';
import 'package:pengen_chat/features/thread/data/thread_service.dart';
import 'package:pengen_chat/features/thread/domain/model/thread_model.dart';

class LikesController extends GetxController {
  var likedThreads = <ThreadModel>[].obs;
  var isLoading = true.obs;
  ThreadService threadService = ThreadService();

  @override
  void onInit() {
    super.onInit();
    getLikedThreads();
  }

  Future<void> getLikedThreads() async {
    isLoading.value = true;
    try {
      likedThreads.value = await threadService.getLikedThreadsByUserID(
        "00000000-0000-0000-0000-000000000002"
      );
    } catch (e) {
      SnackbarHelper.error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}