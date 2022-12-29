import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/components/button.dart';
import 'package:kurtlar/frontend/pages/home_view.dart';
import 'package:kurtlar/frontend/pages/login_view.dart';
import 'package:kurtlar/main.dart';
/* Uygulamada degıstırılecek seyler */

/* Bu sayfada 5 haneli random kod ureten bır fonksıyon yazılacak. 
    Bu fonksıyon TextButton ıcerısınde cagırılacak. */

/* Ayrıca eğer textField'lar bos ıse bu durum kontrol edılecek ve textFıeld ıcerısınde bır hata mesajı gonderılecek */

/* TextFıeld kontrol işlemi logın sayfasında da yapılacak */

/* Logın sayfasında gırılen e-mail ve password eger database ıcerısınde varsa homePage'e gırecek. 
Gırılen degerler database ıcerısınde degılse hata kodu verılecek */

/* Anasayfaya geldıkten sonra telefonu kullanan kısının dataBase'indeki invite code bilgisi cekılıp 
   profile_view dartt dosyasındakı ınviteCode text ıcerısınde kullanılacak */

/* Ayrıca bu kullanıcının nıckname'ı profılevıew da en basta gozukecek ama bu nıckname profılevıew da degıtırılebılecek */

/* Anasayfayı gectıkten sonra telefonu elınde tutan kısı code'u gırdıkten sonra eğer bu kod database ıcerısınde varsa
   sayfa uzerınde bu koda sahıp olan oyuncunun ısmı gozukecek. Bu ınvıte code database ıcerısınde degılse hata mesajı verecek */

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var username = TextEditingController();
  var password = TextEditingController();
  var mail = TextEditingController();
  // Users collectionda bizim verileri tuttugumuz yer var. Bu tuttugumuz yer bır degıskenın ıcıne atıldı.
  var data = FirebaseFirestore.instance.collection('users');

  // It is going the generate invideCode


  String generateCode() {
    var rng = new Random();
    var code = "";
    for (int i = 0; i < 5; i++) {
      if (i < 2) {
      // Generate a random letter
        code += new String.fromCharCode(rng.nextInt(26) + 65);
      } else {
        // Generate a random number
        code += rng.nextInt(10).toString();
      }
    }
    return code;
  }

  /* Kaydet adlı fonksıyon, kullanıcı adı ve sıfrede yazılan bılgılerı bu fonksıyon ıcerısıne alır ve 
  Sayfanın sonundakı kaydet butonuna bastıgımız zaman bu fonksıyon ıcerısıne gonderdıgımız bılgılerı database'e gonderır. */

  /* Bu fonksıyondakı parametrelerın tamamlanması ıcın bu sayfa ıcerısıde random sayı ureten bır 
    fonksıyon yazılacak ve bu fonksıyon cagırıldıgında her bır kullanıcı ıcın unique bir invite code olusturacak */

  void kaydet(var data, String mail, String username, String password,
      int money, int point, String inviteCode) {
    //while
    //var x = generateCode();

    setState(() {
      data.add({
        "username": username,
        "password": password,
        "invitecode": inviteCode,
        "money": money,
        "point": point,
        "mail": mail
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    /* Bu textler regıster sayfasında textFıeldların ıcını doldurmadan gırmeyı onlemek ıcın yaratıldı*/

    /* Sayfanın ana sablonu burada olusturuldu */
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        /* Logın sayfasına donmek ıcın ıcon koyuldu */
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
            });
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor: Colors.black,
        title: Text(translate(context).signup),
        centerTitle: true,
      ),

      /* Sayfa govdesınde 2 adet textFıeld 1 adet button var */
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 50, 50, 20),
        child: Column(
          children: [
            /* Maili alan textFıeld */
            TextField(
              controller: mail,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                  hintText: 'Mail',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0))),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: username,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.accessibility_new,
                    color: Colors.black,
                  ),
                  hintText: translate(context).username,
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0))),
            ),
            const SizedBox(height: 50),

            /* Sıfreyı alan textFıeld */
            TextField(
              controller: password,
              obscureText: true,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_person_outlined,
                    color: Colors.black,
                  ),
                  hintText: translate(context).password,
                  // errorText: 'Sımdı Sıctın AQ',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0))),
            ),
            const SizedBox(height: 40),

            /* Uyelık olusturulduktan sonra Logın sayfasına gerı donulecek */

            /* Text Button yerıne farklı bizim components'da yarattıgımız button cekılebılır. 
           Textler eger bossa textFıeld ıcerısınde hata mesajı gonderılebılır. */
            TextButton(
                onPressed: (() {
                  setState(() {
                    if (password.text == '' ||
                        username.text == '' ||
                        mail.text == '') {
                      print('Veri Geldi');
                    } else {
                      kaydet(data, mail.text, username.text, password.text, 0,
                          0, generateCode());
                      print("Veri yüklendi");
                      Navigator.pop(context);
                    }
                  });
                }),
                child: Text("Kaydet"))
          ],
        ),
      ),
    );
  }
}
