import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/base/color_constants.dart';
import 'package:kurtlar/frontend/base/widget_base.dart';
import 'package:kurtlar/frontend/pages/roles_view.dart';

import '../components/button.dart';

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends BaseState<PlayerPage> {
  List<String> _playerCodes = [];

  void _addPlayer(String _playerCode) {
    setState(() {
      _playerCodes.add(_playerCode);
    });
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: _playerCodes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow[200],
                    ),
                    child: Center(
                      child: Text(_playerCodes[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                    ),
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
                builder: (context) {
                  return AddPlayerBottomSheet(_addPlayer);
                });
          },
          child: Text(translate(context).add)),
    );
  }
}

// BottomSheet widget'ı
class AddPlayerBottomSheet extends StatefulWidget {
  final Function(String) onPlayerAdded;

  AddPlayerBottomSheet(this.onPlayerAdded);

  @override
  _AddPlayerBottomSheetState createState() => _AddPlayerBottomSheetState();
}

class _AddPlayerBottomSheetState extends State<AddPlayerBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late String _playerCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Oyuncu Kodu'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen oyuncunun kodunu girin';
                }
                return null;
              },
              onSaved: (value) {
                _playerCode = value!;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  widget.onPlayerAdded(_playerCode);
                  Navigator.pop(context);
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
