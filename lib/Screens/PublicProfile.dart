import 'package:flutter/material.dart';
import 'package:solid_auth/solid_auth.dart';

import '../models/GetRdfData.dart';
import 'ProfileInfo.dart';

class PublicProfile extends StatefulWidget {

  final String webId;

  const PublicProfile({ required this.webId});

  @override
  State<PublicProfile> createState() => _PublicProfileState();
}

class _PublicProfileState extends State<PublicProfile> {


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    String webId = widget.webId;


    // return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Public profile"),
      //   centerTitle: true,
      // ),

    // );


    return Scaffold(
      appBar: AppBar(
        title: const Text("Public profile"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Container(
          color: Colors.amber,
          child: FutureBuilder(
            future: fetchProfileData(webId), // Get profile data (.ttl file) from the webId
            builder: (context, snapshot) {
              // Widget returnVal;
              // if(snapshot.connectionState == ConnectionState.done){
              //   returnVal = _loadedScreen(context, snapshot.data!, webId);
              // }
              // else{
              //   returnVal = _loadingScreen(context);
              // }

              if (snapshot.hasData) {
                
                // Get profile information from the .ttl file
                PodProfile podProfile = PodProfile(snapshot.data.toString());
                String profPic = podProfile.getProfPicture();
                String profName = podProfile.getProfName();
                String profDob = podProfile.getPersonalInfo('bday');
                String profOcc = podProfile.getPersonalInfo('role');
                String profOrg = podProfile.getPersonalInfo('organization-name');
                String profCoun = podProfile.getPersonalInfo('country-name');

                // Set profile picture url (if any)
                String picUrl = webId;
                if(profPic.contains('http')){
                  picUrl = profPic;
                }
                else{
                  if(profPic != ''){
                    picUrl = picUrl.replaceAll('card#me', profPic);
                  }
                  else{
                    // Dafault picture
                    picUrl = 'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg';
                  }
                }

                // Store profile info
                Map profData = {
                  'name': profName,
                  'picUrl': picUrl,
                  'dob': profDob,
                  'occ': profOcc,
                  'org': profOrg,
                  'loc': profCoun,
                };

                // Profile screen
                return Container(
                  width: width,
                  height: height,
                  color: Colors.white,
                  child: Column(
                    children: [
                      // Header(mainDrawer: _scaffoldKey, logoutUrl: 'none'),
                      const Divider(thickness: 1),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(50),
                            child: ProfileInfo(profData:profData, profType:'public')
                        ),
                      )
                    ],
                  ),
                );
                
              } else {

                // loading screen
                return SizedBox(
                  width: width,
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          "Loding wait",
                          style: TextStyle(
                            fontSize: 25
                          ),
                        ),

                        SizedBox(height: 50,),

                        CircularProgressIndicator()
                      ],
                  ),
                ); 
              }

              // return returnVal;
            }
          ),
        ),
      ),
    );
  }
}