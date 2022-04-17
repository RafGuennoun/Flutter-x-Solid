import 'package:flutter/material.dart';
import 'package:solid_test/Screens/PublicProfile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    String webID= 'https://rafikguennoun.solidcommunity.net/profile/card#me';

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("LOGIN SOLID"),
        centerTitle: true,
      ),

      body: SizedBox(
        // color: Colors.green,
        width: width,
        height: height,
        child: Center(
          child: SizedBox(
            width: width,
            height: height*0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "webID =\n $webID",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20
                    ),
                  ),
                ),

                // public data
                SizedBox(
                  height: 60,
                  width: width*0.75,
                  child: ElevatedButton(
                    child: const Text("1. Public data"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                    ),
                    onPressed: (){
                      debugPrint("#### Public data pressed : ");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PublicProfile(webId: webID,)
                        ),
                      );
                    }, 
                  ),
                ),

                // get a pod
                SizedBox(
                  height: 60,
                  width: width*0.75,
                  child: ElevatedButton(
                    child: const Text("Get a pod"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                    ),
                    onPressed: (){
                      debugPrint("#### Get a pod pressed : ");
                    }, 
                  ),
                ),

                // login
                SizedBox(
                  height: 60,
                  width: width*0.75,
                  child: ElevatedButton(
                    child: const Text("Login"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                    ),
                    onPressed: (){
                      debugPrint("#### Login pressed : ");
                    }, 
                  ),
                ),

                
              ],
            ),
          ),
        ),
      ),
    );
  }
}