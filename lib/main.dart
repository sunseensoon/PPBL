import 'package:flutter/material.dart';
import 'package:modul_1_state/models/preferensi.dart';
import 'package:provider/provider.dart';
import 'package:modul_1_state/models/playlist.dart';
import 'package:modul_1_state/screens/player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => LaguSaatIniModel(
                const Lagu(0, '', '', 'assets/cover/music-placeholder.png'))),
        ChangeNotifierProvider(create: (_) => PreferencesModel())
      ],
      child: MaterialApp(
        title: 'Tidak memainkan lagu',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: const FitPlayer(title: 'Pemutar Musik FIT'),
      ),
    );
  }
}
