import 'package:flutter/material.dart';
import 'package:async_loader/async_loader.dart';

import 'package:char_sheet_5e/JsonModels/ListFiles_model.dart';
import 'package:char_sheet_5e/JsonModels/Character_model.dart';
import 'package:char_sheet_5e/StorageManagement.dart';
import 'package:char_sheet_5e/App_Data_Manager.dart';

class ChangeCharacter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future<List<CharList>> _loadCharacterList() async {
      List<CharList> charNames = [];
      for (int i = 0;
          i < AppDataManager.of(context).fileList.filenames.length;
          i++) {
        StorageManagement.loadSpecificChar(
                AppDataManager.of(context).fileList.filenames[i])
            .then((char) {
          print(char.charName);
          CharList newChar = new CharList(
              char.charName, char.charId, char.charImagePath, char.charClass.className);
          charNames.add(newChar);
        });
      }
      return charNames;
    }

    Widget _charList(List<CharList> names) {
      return ListView.builder(
          padding: EdgeInsets.only(top: 3.0),
          itemCount: names.length,
          itemBuilder: (BuildContext context, int i) {
            void returnTOMenu() async {
              Future.delayed(Duration(milliseconds: 0), () async {AppDataManager.of(context).setNewChar(names[i].charId);}).then((g) {
                Navigator.of(context).pop();
              });
            }

            return GestureDetector(
              onTap: () => returnTOMenu(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                height: MediaQuery.of(context).size.height * 0.15,
                margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: ExactAssetImage(
                          names[i].charImagePath,
                        ),
                        radius: MediaQuery.of(context).size.height * 0.055),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          names[i].charName,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.032,
                              color: Colors.white),
                        ),
                        Text(
                          names[i].charClass,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.024,
                              color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          });
    }

    //shows loading screen while reading database & character data
    var charDataLoader = new AsyncLoader(
      initState: () async => await _loadCharacterList(),
      renderLoad: () => new CircularProgressIndicator(),
      renderError: ([error]) => new Text('Error: Someting something'),
      renderSuccess: ({data}) => _charList(data),
    );

    return Scaffold(
        backgroundColor: Color(0xFF1D1D1D),
        appBar: AppBar(
          title: Text(
            "Characters",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.add_circle_outline, color: Colors.white),
                //onPressed: () => Navigator.of(context).pushNamed('/CreatorPage'),
                onPressed: () => AppDataManager.of(context).newCharacter(),)
          ],
        ),
        body: charDataLoader);
  }
}

class CharList {
  String charName;
  String charId;
  String charImagePath;
  String charClass;

  CharList(this.charName, this.charId, this.charImagePath, this.charClass);
}
