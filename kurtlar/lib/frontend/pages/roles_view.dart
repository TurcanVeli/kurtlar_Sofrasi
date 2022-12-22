import 'package:flutter/material.dart';
import 'package:kurtlar/frontend/components/alert_dialog.dart';
import 'package:kurtlar/frontend/components/button.dart';
import 'package:kurtlar/frontend/pages/registerview.dart';
import '../base/widget_base.dart';
import '../constant/constant.dart';

class rolesPage extends StatefulWidget {
  const rolesPage({super.key});

  @override
  State<rolesPage> createState() => _rolesPageState();
}

class _rolesPageState extends BaseState<rolesPage> {
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
                    width: dynamicWidth(0.3),
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
              height: dynamicHeight(0.1),
            ),
            Container(
              height: dynamicHeight(0.4),
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
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return DescribeOfRoles(
                                  header: mafias[index].GetName,
                                  explanation: mafias[index].GetRoleDefiniton);
                            }));
                      },
                      child: Container(
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
                                    setState(() {
                                      mafias[index].decrase();
                                    });
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
                                  onTap: () {
                                    setState(() {
                                      mafias[index].increment();
                                    });
                                  },
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
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: dynamicHeight(0.1),
            ),
            Container(
              width: dynamicWidth(0.3),
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
              height: dynamicHeight(0.1),
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
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return DescribeOfRoles(
                                  header: goverment[index].GetName,
                                  explanation:
                                      goverment[index].GetRoleDefiniton);
                            }));
                      },
                      child: Container(
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
                                  onTap: () {
                                    setState(() {
                                      goverment[index].decrase();
                                    });
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
                                Text(goverment[index].Getcount.toString()),
                                SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      goverment[index].increment();
                                    });
                                  },
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Button(
              buttonText: "Devam Et",
              where: registerPage(),
              Height: 45,
              Width: dynamicWidth(0.8),
            )
          ],
        ),
      ),
    );
  }
}
