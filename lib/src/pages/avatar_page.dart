import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AvatarPage'),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.all(5.0),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/704541600408539136/cyRUHn4R_400x400.jpg'),
              radius: 30.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
              backgroundColor: Colors.brown,
              child: Text('SL'),
            ),
          )
        ],
      ),
      body:  const  Center(
      child: FadeInImage(
        image:   NetworkImage('https://pbs.twimg.com/profile_images/704541600408539136/cyRUHn4R_400x400.jpg'),
        placeholder:  AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200)
      ),     
      ),
    );
  }
}
