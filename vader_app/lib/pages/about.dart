import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        centerTitle: true,
        title: const Text('About sidan'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: NetworkImage(
                "https://media.tenor.com/kDObCBWhEVwAAAAC/colet-bini-ph.gif"),
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: Container(
              alignment: Alignment.center,
              height: 100,
              child: Text(
                "About this fantastiska app",
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 100),
            child: Container(
              alignment: Alignment.center,
              height: 100,
              child: Text(
                "Detta är en app som visar väder och vind. Självklart visar vi bättre väder än vad som egentligen är så ni fortsätter använda vår fantastiska app! ",
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/');
            },
            child: const Text('Tillbaka till vädret'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[300]),
          ),
        ],
      ),
    );
  }
}
