import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Popups {

  void aboutProject(BuildContext context, Map<String, dynamic> lang) {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Projekt Školský EKOlobeh"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleChildScrollView(
              child: Container(
                child:      
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        overflow: TextOverflow.clip
                      ),
                      children: [
                        TextSpan(
                          text: "Projekt "
                        ),
                        TextSpan(
                          text: "Školský EKOlobeh ",
                          style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                        TextSpan(
                          text: "je zameraný na ekologický životný štýl, inšpirovanie mladej generácie na pestovanie vlastnej zelene a zväčšenie úcty k jedlu.",
                        ),
                        TextSpan(
                          text: "\n\nAktivita je podporená z projektu Erasmus+:"
                        ),
                        TextSpan(
                          text: "\nPríležitosti pre mladých - vedomosti, zručnosti a prax",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                        ),
                      ],
                    )
                  ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              child: 
                SvgPicture.asset(
                  "assets/trojlogo.svg",
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(lang["BACK"]),
          ),
        ],
      );
    });
  }

  void plantInfo(BuildContext context, Map<String, dynamic> plantInfo, Map<String, dynamic> lang) {
    showDialog(context: context, builder: (BuildContext context) {
      return 
      AlertDialog(
        title: Text(plantInfo["NAME"]),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleChildScrollView(
              child: Container(
                child:      
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        overflow: TextOverflow.clip
                      ),
                      children: [
                        TextSpan(
                          text: plantInfo["DESCRIPTION"] + "\n\n"
                        ),
                        TextSpan(
                          text: lang["GROW_TIME"],
                          style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                        TextSpan(
                          text: plantInfo["GROW_TIME"] + "\n",
                        ),
                        TextSpan(
                          text: lang["PLANTING_SEASON"],
                          style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                        TextSpan(
                          text: plantInfo["PLANTING_SEASON"] + "\n",
                        ),
                        TextSpan(
                          text: lang["HARVESTING_SEASON"],
                          style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                        TextSpan(
                          text: plantInfo["HARVESTING_SEASON"] + "\n",
                        ),
                        TextSpan(
                          text: lang["THREATS"],
                          style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                        TextSpan(
                          text: plantInfo["THREATS"] + "\n",
                        ),
                      ],
                    )
                  ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              child: 
                ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  plantInfo["IMG_FILE"],
                  fit: BoxFit.cover, 
                ),
              )
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(lang["BACK"]),
          ),
        ],
      );
    });
  }
}