import 'package:workmanager/workmanager.dart';
import 'sync_users.dart'; // Import sync function

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    await syncUsers();
    return Future.value(true);
  });
}
