import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Analyse Voyelles",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String word = '';
  Map<String, int> VoyelleOccurrences = {
    'a': 0,
    'e': 0,
    'i': 0,
    'o': 0,
    'u': 0,
    'y': 0,
  };
  int ConsonnesCompteur = 0;

  List<Color> containerColors = [
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 253, 14, 197),
    const Color.fromARGB(255, 252, 153, 4),
    const Color.fromARGB(255, 214, 228, 28),
    const Color.fromARGB(255, 24, 161, 20),
    const Color.fromARGB(255, 0, 255, 153),
    const Color.fromARGB(255, 0, 0, 0),
  ];

  void countVowelsAndConsonants() {
    VoyelleOccurrences = {
      'a': 0,
      'e': 0,
      'i': 0,
      'o': 0,
      'u': 0,
      'y': 0,
    };
    ConsonnesCompteur = 0;

    for (int i = 0; i < word.length; i++) {
      String lettre = word[i].toLowerCase();
      if (VoyelleOccurrences.containsKey(lettre)) {
        setState(() {
          VoyelleOccurrences[lettre] = (VoyelleOccurrences[lettre] ?? 0) + 1;
        });
      } else if (RegExp('[a-z]').hasMatch(lettre)) {
        ConsonnesCompteur++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Analyse Voyelles"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  word = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Entrez un mot",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  countVowelsAndConsonants();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: const Text(
                  'Analyser',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const SizedBox(
                height: 20
                ), 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: VoyelleOccurrences.entries.map((entry) {
                int index = VoyelleOccurrences.keys.toList().indexOf(entry.key);
                return Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color:
                                containerColors[index % containerColors.length],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '  ${entry.key.toUpperCase()} ',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: 'Pattaya',
                                  ),
                                ),
                                TextSpan(
                                  text: '   :   ${entry.value}   Occurrences',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'Pattaya',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 10
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: '  Consonnes ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'Pattaya',
                              ),
                            ),
                            TextSpan(
                              text: '   :   $ConsonnesCompteur   Occurrences',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'Pattaya',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
