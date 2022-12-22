import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _playerCodes = [];

  void _addPlayer(String _playerCode) {
    setState(() {
      _playerCodes.add(_playerCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          },
              icon: Icon(Icons.keyboard_arrow_left_rounded,color: Colors.black,)),
          title: Text('OYUNCU EKLE')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          // Birden fazla oyuncu girildiğinde bu oyuncuları GridView ile sıralayan widget
          _playerCodes.length > 0
              ? Expanded(
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
                      child: Text(_playerCodes[index],style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.w900
                      )),
                    ),
                  ),
                );
              },
            ),
          ):

          Container(
            child: ElevatedButton(child: Text('Devam'),
              onPressed: () {
              },),
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
                }
            );
          },
          child: Text('Add')
      ),

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
              child: Text('Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
