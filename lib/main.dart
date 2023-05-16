import 'package:app_consumiendo_api/presentation/screens/home_page.dart';
import 'package:app_consumiendo_api/presentation/services/morty_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MortyService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomePage(),
        },
        theme: ThemeData(
          useMaterial3: true,
        ),
      ),
    );
  }
}
