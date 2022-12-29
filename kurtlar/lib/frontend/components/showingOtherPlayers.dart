import 'package:flutter/material.dart';

import '../models/players.dart';

Container UsersShowingContainer(double height, List<Players> Users) {


  return Container(
      height: height,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              childAspectRatio: 4 / 6,
              crossAxisSpacing: 20,
              mainAxisSpacing: 34),
          itemCount: Users.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Image.asset('assets/images/deafultAvatar.png'),
                  ),
                  Text(Users[index].GetName),
                ],
              ),
            );
          }));
}
