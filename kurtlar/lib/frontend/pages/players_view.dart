import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/backend/service/auth.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/base/widget_base.dart';
import 'package:kurtlar/frontend/pages/roles_view.dart';

import '../components/button.dart';

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends BaseState<PlayerPage> {
  List<DocumentSnapshot> _players = [];

  void _addPlayer(DocumentSnapshot player) {
    setState(() {
      _players.add(player);
    });
  }
  void ShowAlertDialog(BuildContext context) {
    Widget okBtn = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(translate(context).ok));

    AlertDialog alert = AlertDialog(
      title: const Text("Alert"),
      content: const Text('There is no user who has this code'),
      actions: <Widget>[okBtn],
    );

    showDialog(
        context: context,
        builder: (BuildContext buildercontext) {
          return alert;
        });
  }
   void checkCodeValid(){
      
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorConstant.instance.black,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: ColorConstant.instance.white,
              )),
          title: Text(translate(context).clickAdd)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          // Birden fazla oyuncu girildiğinde bu oyuncuları GridView ile sıralayan widget

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                childAspectRatio: 4 / 6,
                crossAxisSpacing: 34,
                mainAxisSpacing: 34),
              itemCount: _players.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        child: Image.asset("assets/images/deafultAvatar.png")),
                      Text(_players[index]['userName'])
                    ],
                  ),
                );
              },
            ),
          ),
          BottomButtonContainerContiune(
            context: context,
            height: dynamicHeight(0.08),
            buttonText: translate(context).contiune,
            where: rolesPage(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white30,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return AddPlayerBottomSheet(_addPlayer,ShowAlertDialog);
                });
          },
          child: Text(translate(context).add)),
    );
  }
}

// BottomSheet widget'ı
class AddPlayerBottomSheet extends StatefulWidget {
  final Function(DocumentSnapshot) onPlayerAdded;
  final Function(BuildContext) alert;
  AddPlayerBottomSheet(this.onPlayerAdded, this.alert);

  @override
  _AddPlayerBottomSheetState createState() => _AddPlayerBottomSheetState();
}

class _AddPlayerBottomSheetState extends State<AddPlayerBottomSheet> {
  AuthService _fetch = AuthService();
  final _formKey = GlobalKey<FormState>();
  String _playerCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: translate(context).gamecode),
              validator: (value) {
                if (value.isEmpty) {
                  return translate(context).entercode;
                }
                return null;
              },
              onSaved: (value) {
                _playerCode = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                 
                }
              },
              child: Text(translate(context).add),
            ),
          ],
        ),
      ),
    );
  }
}


