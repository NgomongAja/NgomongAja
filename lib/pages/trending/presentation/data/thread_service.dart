import 'package:pengen_chat/common/config/supabase.dart';
import 'package:pengen_chat/pages/trending/models/thread_model.dart';

class ThreadService {
  Future<void> addNewThread(String title, String userId) async {
    try {
      await SupabaseConfig.instance.supabaseClient.from('threads').insert({
        'title': title,
        'user_id': userId,
      });
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ThreadModel>> listenToThreadStream() async{

    List<ThreadModel> threads = [];

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
          threads = newList;
        });

        return threads;
  }

}
