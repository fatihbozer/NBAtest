import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nba_api/model/player.dart';

class PlayerPage extends StatelessWidget {
  List<Player> players = [];

  Future getPlayers() async {
    try {
      var response = await http.get(
        Uri.https('api.balldontlie.io', 'v1/players'),
        headers: {
          'Authorization': 'd17d5253-7931-4b93-9757-444817f11f67',
        },
      );
      var jsonData = jsonDecode(response.body);
      for (var eachPlayer in jsonData['data']) {
        final player = Player(firstname: eachPlayer['first_name'], lastname: eachPlayer['last_name'], jerseynumber: eachPlayer['jersey_number']);
        players.add(player);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NBA PLAYERS'),
      ),
      body: FutureBuilder(
          future: getPlayers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(players[index].firstname + players[index].lastname),
                    subtitle: Text('${players[index].jerseynumber}'),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
