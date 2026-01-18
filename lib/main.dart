import "dart:convert";

import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:skolsky_ekolobeh/popups.dart";
import "package:skolsky_ekolobeh/plant_description.dart";

void main() {
  runApp(const CommunityGardenApp());
}

class CommunityGardenApp extends StatelessWidget {
  const CommunityGardenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Školský EKOlobeh',
      theme: ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),
      home: const GardenScreen(),
    );
  }
}

class GardenScreen extends StatefulWidget {
  const GardenScreen({super.key});

  @override
  State<GardenScreen> createState() => _GardenScreenState();
}

class _GardenScreenState extends State<GardenScreen> {

  Map<String, dynamic> plants = {};
  Map<String, dynamic> lang = {};

  final List<String> languages = ["🇸🇰", "🇺🇦", "🇭🇺"];
  String selectedLanguage = "sk";

  Future<void> loadLanguage(String lng) async {
    final String jsonString = await rootBundle.loadString("assets/localization.json");
    lang = jsonDecode(jsonString);
    setState(() {
      lang = lang[lng];
    });
  }

  Future<void> loadPlants() async {
    final String jsonString = await rootBundle.loadString("assets/loc_sk_plants.json");
    setState(() {
      plants = jsonDecode(jsonString);
    });
  }

  @override
  void initState() {
    super.initState();
    loadPlants();
    loadLanguage("sk");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Školský EKOlobeh'),
        actions: [
          MediaQuery.of(context).size.width > 420 
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[300],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              onPressed: () => Popups().aboutProject(context, lang), 
              child: Row(
                children: [
                  SvgPicture.asset("assets/Erasmus.svg", height: 24),
                  const SizedBox(width: 8),
                  const Text("O Projekte"),
                ],
              ),
            )
          : IconButton(
              onPressed: () => Popups().aboutProject(context, lang),
              icon: SvgPicture.asset("assets/Erasmus.svg", height: 30),
            ),

          SizedBox(width: 8),

          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedLanguage,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
              style: const TextStyle(color: Colors.black, fontSize: 20),
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue.toString();
                });
                loadLanguage(newValue.toString());
              },
              items: [
                const DropdownMenuItem(value: "sk", child: Text("🇸🇰")),
                const DropdownMenuItem(value: "ua", child: Text("🇺🇦")),
                const DropdownMenuItem(value: "hu", child: Text("🇭🇺")),
              ],
            ),
          )
        ]
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child:
                ListView.builder(
                  itemCount: plants.length,
                  itemBuilder: (context, index) {
                    return (
                      MediaQuery.of(context).size.width > 420 ? 
                        plantDescriptionDesktop(context, plants, lang, index.toString())
                      
                      : plantDescriptionMobile(context, plants, lang, index.toString())
                    );
                  }
                ),
            ),
          ],
        ),
      ),
    );
  }


  Widget languageSelector(){
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        alignment: AlignmentDirectional.centerStart,
        value: selectedLanguage,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
        onChanged: (String? newValue) {
          setState(() {
            selectedLanguage = newValue!;  
          });
        },
        items: languages.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontSize: 20),
            ),
          );
        }).toList(),
        isDense: false, 
      ),
    );
  }
}
