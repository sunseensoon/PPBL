import 'package:flutter/material.dart';
import 'package:modul_1_state/models/playlist.dart';
import 'package:provider/provider.dart';
import 'package:modul_1_state/models/preferensi.dart'; // Import PreferencesModel

const List<Widget> icons = <Widget>[
  Icon(Icons.shuffle),
  Icon(Icons.repeat),
];

class FitPlayer extends StatelessWidget {
  const FitPlayer({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Pemutar Lagu FIT')),
      body: ListView(
        children: <Widget>[
          // Gambar lagu yang sedang diputar
          Consumer<LaguSaatIniModel>(
              builder: (context, lagu, child) => Image.asset(
                    '${lagu.saatIni.imagePath}',
                    height: 400,
                    width: 400,
                    alignment: Alignment.center,
                  )),
          Consumer<LaguSaatIniModel>(
            builder: (context, lagu, child) => Padding(
              padding: EdgeInsets.only(bottom: 40, top: 10),
              child: Text(
                '${lagu.saatIni.judul}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Daftar lagu
          ListView.builder(
              itemCount: PlaylistModel.daftarLagu.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                    margin: EdgeInsets.only(left: 16, top: 8, right: 16),
                    child: ListTile(
                      title: Text(
                          "${PlaylistModel.daftarLagu[index].judul} (${PlaylistModel.daftarLagu[index].artis})"),
                      onTap: () {
                        var laguSaatIni = context.read<LaguSaatIniModel>();
                        laguSaatIni.saatIni = PlaylistModel.daftarLagu[index];
                      },
                    ));
              }),

          // Tombol ACAK
          Consumer<PreferencesModel>(
            builder: (context, preferences, child) => ElevatedButton(
              onPressed: () {
                preferences.toggleAcak(); // Ubah status acak
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: preferences.acak
                        ? Text("Main secara acak")
                        : Text("Main secara berurutan"),
                  ),
                );
              },
              child: Text(preferences.acak ? "ACAK MATI" : "ACAK AKTIF"),
            ),
          ),

          // Tombol BERULANG
          Consumer<PreferencesModel>(
            builder: (context, preferences, child) => ElevatedButton(
              onPressed: () {
                preferences.toggleBerulang(); // Ubah status berulang
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: preferences.berulang
                        ? Text("Playlist berulang")
                        : Text("Playlist tidak berulang"),
                  ),
                );
              },
              child: Text(
                  preferences.berulang ? "BERULANG MATI" : "BERULANG AKTIF"),
            ),
          ),
        ],
      ),
    );
  }
}
