// Flutter imports:
import 'package:flutter/material.dart';


// Project imports:


class ProfileInfo extends StatelessWidget {
  final Map? profData;     // Profile data
  final Map? authData;     // Authentication related data
  final String? profType;  // Public or private
  final String? webId;     // WebId of the user

  const ProfileInfo({
  
    @required this.profData,
    @required this.profType,
    this.authData,
    this.webId
  });
  

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2, blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0,10)
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(profData!['picUrl'])
                        )
                    ),
                  ),
                  if(profType == 'private')
                  Positioned( 
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: Colors.blueGrey,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.edit), 
                        color: Colors.white,
                        onPressed: () { 
                          // Navigate to the profile edit function
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => EditProfile(
                          //                                         authData: authData,
                          //                                         webId: webId,
                          //                                         profData: profData,
                          //                                         )
                          //   ),
                          // );
                          },
                        ),
                    )
                  ),
                ],
              ),
              // Display profile data
              const SizedBox(height: 50,),
              profileMenuItem("BASIC INFORMATION"),
              const SizedBox(height: 20,),
              buildLabelRow('Name', profData!['name']),
              buildLabelRow('Birthday', profData!['dob']),
              buildLabelRow('Country', profData!['loc']),
              //
              profileMenuItem("WORK"),
              const SizedBox(height: 20,),
              buildLabelRow('Occupation', profData!['occ']),
              buildLabelRow('Organisation', profData!['org']),
              //
            ],
          ),
        ),
      ], 
    );
  }

  // A menu item
  Row profileMenuItem(String title){
    return Row(children: <Widget>[
      Text(
        title,
        style: TextStyle(
          color: Colors.grey[300],
          letterSpacing: 2.0,
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          ),
        ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 0.0),
            child: Divider(
              color: Colors.grey[300],
              height: 36,
            )),
      ),
    ]);
  }

  // A profile info row
  Column buildLabelRow(String labelName, String profName) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
            '$labelName:',
            style: const TextStyle(
              color: Colors.green,
              letterSpacing: 2.0,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              profName,
              style: TextStyle(
                color: Colors.grey[800],
                letterSpacing: 2.0,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                ),
            ),
          ],
        ),
        const SizedBox(height: 30,)
      ],
    );
  }
}
