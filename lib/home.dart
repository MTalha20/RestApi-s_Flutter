import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:restapi/apiService.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var Url = 'reqres.in';
  var Endpoint = '/api/users';
  var id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button("Get", Colors.blue, 1),
            SizedBox(
              height: 20,
            ),
            Button("Post", Colors.yellow, 2),
            SizedBox(
              height: 20,
            ),
            Button("Update", Colors.green, 3),
            SizedBox(
              height: 20,
            ),
            Button("Delete", Colors.red, 4),
          ],
        ),
      ),
    );
  }

  Widget Button(label, color, index) {
    return MaterialButton(
        child: Text(label),
        color: color,
        onPressed: () async {
          if (index == 1) {
            var data = await ApiServices.getUsers(Url, Endpoint);
            print(data);
          } else if (index == 2) {
            var data = await ApiServices.postUsers(
                Url, Endpoint, 'talha', 'developer');
            id = data['id'];
            print(data);
            print(id);
          } else if (index == 3) {
            var data = await ApiServices.updateUsers(
                Url, Endpoint, id, 'talha updated', 'developer updated');
            // id is trigered using post method
            print(data);
          } else if (index == 4) {
            var data = await ApiServices.deleteUsers(Url, Endpoint, id);
            print(data);
            // id is trigered using post method
          }
        });
  }
}
