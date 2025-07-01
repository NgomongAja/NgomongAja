import 'package:get/get.dart';
import 'package:pengen_chat/common/config/supabase.dart';
import 'package:pengen_chat/common/ui/general_bottomsheet.dart';
import 'package:pengen_chat/common/ui/snackbar_helper.dart';
import 'package:pengen_chat/pages/trending/presentation/widget/thread_input.dart';
import '../models/thread_model.dart';

class TrendingPresenter extends GetxController {
  var threads = <ThreadModel>[].obs;

  var isLoading = true.obs; // gw siapin buat loading atau shimmer
  var threadInputValue = "".obs;

  @override
  void onInit() {
    super.onInit();
    listenToThreadStream();
  }

  void listenToThreadStream() {
    SupabaseConfig.instance.supabaseClient
        .from('threads')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: false)
        .map((data) => data.map((e) => ThreadModel.fromJson(e)).toList())
        .listen((newList) async {
          for (var thread in newList) {
            final res = await SupabaseConfig.instance.supabaseClient
                .from('users')
                .select('nickname')
                .eq('id', thread.userId!)
                .single();
            thread.nickname = res['nickname'];
          }
          threads.value = newList;
        });
  }

  void openNewThreadForm() {
    GeneralBottomsheet.showGeneralbottomsheet(
      Get.context!,
      ThreadInput(trendingPresenter: this),
    );
  }

  Future<void> createNewThread(String title) async {
    isLoading.value = true;
    try {
      await SupabaseConfig.instance.supabaseClient.from('threads').insert({
        'title': title,
        'user_id':
            "00000000-0000-0000-0000-000000000002", // ini nanti ambil user id hasil dari auth ges
      });
    } catch (e) {
      SnackbarHelper.error(e.toString());
    } finally {
      isLoading.value = false;
      Get.back();
      SnackbarHelper.success("Yeay 🥳 Thread kamu berhasil dibuat");
    }
  }
}
