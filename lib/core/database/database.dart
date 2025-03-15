import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart'; // Run build_runner after setup

@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer().nullable()(); // Nullable because API assigns an ID
  TextColumn get name => text()();
  TextColumn get job => text()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> insertUser(String name, String job) async {
    await into(users).insert(UsersCompanion(
      name: Value(name),
      job: Value(job),
      isSynced: const Value(false), // Mark as unsynced
    ));
  }

  Future<List<User>> getUnsyncedUsers() async {
    return await (select(users)..where((tbl) => tbl.isSynced.equals(false)))
        .get();
  }

  Future<void> updateUser(int localId, int apiId) async {
    await (update(users)..where((u) => u.id.equals(localId))).write(
      UsersCompanion(id: Value(apiId), isSynced: const Value(true)),
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
