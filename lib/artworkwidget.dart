import 'package:flutter/material.dart';

class ArtworkWidget extends StatefulWidget {
  const ArtworkWidget({super.key});

  @override
  State<ArtworkWidget> createState() => _ArtworkWidgetState();
}

class _ArtworkWidgetState extends State<ArtworkWidget> {
  // Ajout d'un état pour suivre si l'œuvre d'art est favorisée
  bool _isFavorite = false;
  bool _showDescription = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Museum"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset("images/Mona_Lisa.jpg"),
                  if (_showDescription)
                    Positioned.fill(
                      child: Container(
                        color: Colors.black
                            .withOpacity(0.5), // Rend le texte plus lisible
                        child: const SingleChildScrollView(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 1516, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci.",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  Icon(
                    Icons.favorite,
                    size: 100,
                    color: _isFavorite
                        ? Colors.red.withOpacity(1)
                        : Colors.white.withOpacity(0.75),
                  ),
                ],
              ),
            ),
            const Text(
              'Mona Lisa',
              style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 30,
                  color: Colors.brown),
            ),
            const Text(
              'Leonard De Vinci',
              style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.favorite),
                  color: _isFavorite ? Colors.red : Colors.brown,
                  onPressed: () {
                    setState(() {
                      // Change l'état lorsqu'on appuie sur le bouton
                      _isFavorite = !_isFavorite;
                    });
                    if (_isFavorite) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Oeuvre ajoutée à vos favoris"),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.article),
                  onPressed: () {
                    setState(() {
                      _showDescription = !_showDescription;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
