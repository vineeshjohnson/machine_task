import 'package:dio/dio.dart';
import '../database/database.dart';

Future<void> syncUsers() async {
  final db = AppDatabase();
  final unsyncedUsers = await db.getUnsyncedUsers();

  if (unsyncedUsers.isNotEmpty) {
    Dio dio = Dio();

    for (var user in unsyncedUsers) {
      try {
        Response response = await dio.post(
          'https://your-api.com/users',
          data: {
            "name": user.name,
            "job": user.job,
          },
        );

        if (response.statusCode == 201) {
         await db.delete(db.users).go();

        }
      } catch (e) {
        print("Sync failed: $e");
      }
    }
  }
}
