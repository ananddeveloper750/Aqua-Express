import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static late Db db;

  static Future<void> connect() async {
    try {
      db = await Db.create("mongodb+srv://<demo_user>:<oKRlehmQYCesClEM>@cluster0.mongodb.net/?retryWrites=true&w=majority&tls=true");
      await db.open();
      print("✅ MongoDB Connected Successfully!");
    } catch (e) {
      print("❌ MongoDB Connection Failed: $e");
    }
  }
}
