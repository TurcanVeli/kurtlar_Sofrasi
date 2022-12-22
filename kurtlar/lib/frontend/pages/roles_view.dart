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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 110,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "DERİN DEVLET",
                        style: TextStyle(color: Colors.white),
                      ),
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
            SizedBox(
              height: 40,
            ),
            Container(
              height: 300,
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(mafias[index].GetName),
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  print("sdf");
                                },
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(mafias[index].Getcount.toString()),
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 110,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text(
                "MAFYA",
                style: TextStyle(color: Colors.white),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 400,
              child: GridView.builder(
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
                  itemCount: goverment.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Text(goverment[index].GetName),
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(goverment[index].Getcount.toString()),
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
