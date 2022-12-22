import 'package:flutter/material.dart';
import '../constant/constant.dart';

class rolesPage extends StatefulWidget {
  const rolesPage({super.key});

  @override
  State<rolesPage> createState() => _rolesPageState();
}

class _rolesPageState extends State<rolesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Karakter Seçme"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Center(
                      child: Text("DERİN DEVLET"),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("ekle"),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  primary: true,
                  shrinkWrap: true,
                  addAutomaticKeepAlives: true,
                  padding: EdgeInsets.all(0),
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 3,
                      crossAxisCount: 4,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.5)),
                  itemCount: mafias.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      color: Colors.amber,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 45,
                          ),
                          Text(mafias[index].GetName)
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text("MAFYA"),
            ),
          ],
        ),
      ),
    );
  }
}
