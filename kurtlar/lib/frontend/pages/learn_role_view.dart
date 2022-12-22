import 'package:flutter/material.dart';

//Defalarca Retrun edecek, Her birinde Farklı bir kişiyü göstercek
//Sırası gelen kişiyi gösterecek ve kişi objesi alacak

class PrepareForRole extends StatelessWidget {
  //const learnRole({super.key});
  //ToDO constructer tanıma ve kişi objesi alsın.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Image.network("sfdsaf"), // Resmi databaseden alacağız. Resim tıklanabilir olacak Tıklandığınd aColumun sonuna yeni bir widget dönecek.
            SizedBox(
              height: 15,
            ),
            Text("Kullanıcı ismi"),

            Text(
                "Cihazı bu oyuncuya verin hazır olduğunda yukarıda ki profili seçin")
          ],
        ),
      ),
    );
  }
}
