import 'package:flutter/material.dart';
import 'package:skolsky_ekolobeh/popups.dart';

Widget plantDescriptionDesktop(BuildContext context, Map<String, dynamic> plants, Map<String, dynamic> lang, String index, ){
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 4),
    child: InkWell(
      onTap: () => (),
      child: Padding(
        padding: const EdgeInsets.all(12.0), 
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 8,
              height: MediaQuery.of(context).size.width / 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(plants[index]["IMG_FILE"]),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 16),
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plants[index.toString()]["NAME"],
                    style: TextStyle(
                      fontSize: (MediaQuery.of(context).size.width * 0.02).clamp(18, 60),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  localizedSubtitle(context, plants[index], lang),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget plantDescriptionMobile(BuildContext context, Map<String, dynamic> plants, Map<String, dynamic> lang, String index, ){
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 4),
    child: InkWell(
      onTap: () => Popups().plantInfo(context, plants[index], lang),
      child: Padding(
        padding: const EdgeInsets.all(12.0), 
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 8,
              height: MediaQuery.of(context).size.width / 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(plants[index]["IMG_FILE"]),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 16),
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plants[index.toString()]["NAME"],
                    style: TextStyle(
                      fontSize: (MediaQuery.of(context).size.width * 0.02).clamp(18, 60),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    lang["READ_MORE"],
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget localizedSubtitle(BuildContext context, Map<String, dynamic> plantInfo, Map<String, dynamic> lang){
  return 
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
    );
}