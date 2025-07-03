import 'package:get/get.dart';
import 'package:pengen_chat/common/ui/snackbar_helper.dart';
import 'package:pengen_chat/features/thread/data/thread_service.dart';
import '../../domain/model/thread_model.dart';

class RecentController extends GetxController {
  var recents = <ThreadModel>[].obs;

  var isRecentLoading = true.obs;

  ThreadService threadService = ThreadService();

  @override
  void onInit() {
    super.onInit();
    listenToRecentThreadStream();
  }

  void listenToRecentThreadStream() {
    isRecentLoading.value = true;
    try {
      threadService.listenToRecentThreadStream((threadData) {
        recents.value = threadData;
        isRecentLoading.value = false;
      });
    } catch (e) {
      SnackbarHelper.error(e.toString());
      isRecentLoading.value = false;
    }
  }
}
