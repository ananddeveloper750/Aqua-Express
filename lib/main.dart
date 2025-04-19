
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'DBHelper/mongo_database.dart';
import 'SplashScreen/splash_screen.dart';
import 'UiHelper/cart_provider.dart';

void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // try {
  //   await MongoDatabase.connect();
  //   print("✅ MongoDB Connected Successfully!");
  // } catch (e) {
  //   print("❌ MongoDB Connection Failed: $e");
  // }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  SplashScreen(),
      //home: BottomNavigationAppBar(),
      //   home: BottomNavigationAppBar()
      // home: HideBottom(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:Text("Flutter Ripple"),
        ),
      body:Container(),

    );
  }
}
