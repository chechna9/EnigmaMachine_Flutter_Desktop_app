import 'package:enigma_simulator/Providers/errorKeyProvider.dart';
import 'package:enigma_simulator/Providers/messageProvider.dart';
import 'package:enigma_simulator/controllers/main_router.dart';
import 'package:enigma_simulator/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => KeyError(),
        ),
        ChangeNotifierProvider(
          create: (context) => Messages(),
        ),
        ChangeNotifierProvider(
          create: (context) => MainRouter(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    ),
  );
}
