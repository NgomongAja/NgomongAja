import 'package:get/get.dart';
import 'package:pengen_chat/common/ui/general_bottomsheet.dart';
import 'package:pengen_chat/common/ui/snackbar_helper.dart';
import 'package:pengen_chat/features/thread/data/thread_service.dart';
import 'package:pengen_chat/features/thread/domain/model/thread_model.dart';
import 'package:pengen_chat/features/thread/presentation/widget/thread_input_widget.dart';

class TrendingController extends GetxController {
  var trendings = <ThreadModel>[].obs;

  var isTrendingLoading = true.obs; // gw siapin buat loading atau shimmer
  var isRecentLoading = true.obs;
  var threadInputValue = "".obs;

  ThreadService threadService = ThreadService();

  @override
  void onInit() {
    super.onInit();
    listenToThreadStream();
  }

  void listenToThreadStream() {
    isTrendingLoading.value = true;
    try {
      threadService.listenToThreadStream((threadData) {
        trendings.value = threadData;
        isTrendingLoading.value = false;
      });
    } catch (e) {
      SnackbarHelper.error(e.toString());
      isTrendingLoading.value = false;
    }
  }

  void openNewThreadForm() {
    GeneralBottomsheet.showGeneralbottomsheet(
      Get.context!,
      ThreadInputWidget(trendingController: this),
    );
  }

  Future<void> createNewThread(String title) async {
    isTrendingLoading.value = true;
    try {
      await threadService.addNewThread(
        title,
        "00000000-0000-0000-0000-000000000002",
      );
    } catch (e) {
      SnackbarHelper.error(e.toString());
    } finally {
      isTrendingLoading.value = false;
      Get.back();
      SnackbarHelper.success("Yeay 🥳 Thread kamu berhasil dibuat");
    }
  }
}
