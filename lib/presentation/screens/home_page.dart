import 'package:app_consumiendo_api/presentation/services/morty_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mortyService = Provider.of<MortyService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Morty"),
      ),
      body: ListView.builder(
        itemCount: mortyService.mortyResults.length,
        itemBuilder: (context, index) {
          final morty = mortyService.mortyResults[index];
          return ListTile(
            title: Text(morty.name),
            subtitle: Text(morty.species.name),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                width: 80,
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(morty.image),
              ),
            ),
          );
        },
      ),
    );
  }
}
