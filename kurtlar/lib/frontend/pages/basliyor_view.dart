// basliyor sayfasi
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(70),
                        width: 150,
                        height: 150,
                        child: Image.asset(
                          'images/mermi.png',
                        )),
                    Container(
                      width: 1000,
                      height: 40,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Başlıyor",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        width: 300,
                        height: 300,
                        child: Text("       "
                            "Mafya devletin içinde gizlice oluştu ve devleti yıkmaya çalışıyor devlette bunu durdurmaya çalışıyor."
                            "Derin devlet kazanmak için bütün mafyayı bulamalıdır, bunu da oylamalar"
                            "ile yapıcaksınız. bu oyunda mafya hariç kimse kimseyi tanımıyor bu yüzden dikkatli olun."
                            "Mafya kazanmak içim her gece oy bilirliği ile seçtikleri bit kişiyi öldürürler ve eğer sayıları derin devletler eşitlenirse onlar kazanır."
                            "oyunda gece ve gündüz mantığı vardır gündüzleri mafyalar yetenek kullanır ve herkes bir kişiyi mahkemeye göndermek için oylama yapar oylamada kim çıkarsa o oyundan  ayrılır bu kişi herkes olabilir. Geceleri ise mafya aralarında kimi öldürceklerini seçer ve onu öldürürler bu sırada derin devlettekiler yeteneklerini kulanırlar."),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("HAZIR"),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          primary: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            )),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required Scaffold home, required Image body})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SettingPageUI(),
    );
  }
}

class SettingPageUI extends StatefulWidget {
  const SettingPageUI({Key? key}) : super(key: key);
  @override
  State<SettingPageUI> createState() => _SettingPageUIState();
}

class _SettingPageUIState extends State<SettingPageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                ))));
  }
}
