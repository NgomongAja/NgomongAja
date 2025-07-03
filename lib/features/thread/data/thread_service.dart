import 'package:pengen_chat/common/config/supabase.dart';
import 'package:pengen_chat/common/utils/logger_util.dart';
import 'package:pengen_chat/features/thread/domain/model/thread_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  void listenToThreadStream(Function(List<ThreadModel>) onDataReceived) {
    try {
      SupabaseConfig.instance.supabaseClient
          .from('threads_with_user')
          .stream(primaryKey: ['id'])
          .order('like_count', ascending: false)
          .map((data) => data.map((e) => ThreadModel.fromJson(e)).toList())
          .handleError((error) {
            LoggerUtil.log('Stream error: $error');
            if (error is RealtimeSubscribeException) {
              Future.delayed(Duration(seconds: 1), () {
                listenToRecentThreadStream(onDataReceived);
              });
            }
          })
          .listen(
            (newList) {
              onDataReceived(newList);
            },
            onError: (error) {
              LoggerUtil.log('Listen error: $error');
              if (error is RealtimeSubscribeException) {
                Future.delayed(Duration(seconds: 1), () {
                  listenToRecentThreadStream(onDataReceived);
                });
              }
            },
          );
    } catch (e) {
      throw ('Setup stream error: $e');
    }
  }

  void listenToRecentThreadStream(Function(List<ThreadModel>) onDataReceived) {
    try {
      SupabaseConfig.instance.supabaseClient
          .from('threads_with_user')
          .stream(primaryKey: ['id'])
          .order('created_at', ascending: false)
          .map((data) => data.map((e) => ThreadModel.fromJson(e)).toList())
          .handleError((error) {
            LoggerUtil.log('Stream error: $error');
            if (error is RealtimeSubscribeException) {
              Future.delayed(Duration(seconds: 1), () {
                listenToRecentThreadStream(onDataReceived);
              });
            }
          })
          .listen(
            (newList) {
              onDataReceived(newList);
            },
            onError: (error) {
              LoggerUtil.log('Listen error: $error');
              if (error is RealtimeSubscribeException) {
                Future.delayed(Duration(seconds: 1), () {
                  listenToRecentThreadStream(onDataReceived);
                });
              }
            },
          );
    } catch (e) {
      throw ('Setup stream error: $e');
    }
  }

  Future<List<ThreadModel>> getLikedThreadsByUserID(String userId) async {
    try {
      final response = await SupabaseConfig.instance.supabaseClient
          .from('thread_likes')
          .select('''
        thread_id,
        threads (
          id,
          title,
          created_at,
          user_id,
          like_count,
          users!threads_user_id_fkey (
            nickname
          )
        )
      ''')
          .eq('user_id', userId);

      final data = response as List;

      return data.map((item) {
        final threadJson = item['threads'];
        final userJson = threadJson['users'];

        return ThreadModel(
          id: threadJson['id'],
          title: threadJson['title'],
          createdAt: threadJson['created_at'],
          userId: threadJson['user_id'],
          likeCount: threadJson['like_count'],
          nickname: userJson != null ? userJson['nickname'] : null,
        );
      }).toList();
    } catch (e) {
      throw ('Error fetching liked threads: $e');
    }
  }
}
