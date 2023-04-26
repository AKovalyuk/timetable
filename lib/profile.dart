import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

class Profile extends StatefulWidget {
  Function callback;
  Profile({
    super.key,
    required this.callback
  });

  @override
  State<Profile> createState() => _ProfileState(callback);
}

class _ProfileState extends State<Profile> {

  String currentGroup = "";
  Function callback;
  _ProfileState(this.callback);

  Future<http.Response> getAutocomplete(String start) {
    return http.get(Uri.parse('https://edu.sfu-kras.ru/api/timetable/autocomplete_new/$start'));
  }

  @override
  Widget build(BuildContext context) {
    return
      Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person, size: 150, color: Colors.grey),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                child: FutureBuilder<SharedPreferences>(
                  future: SharedPreferences.getInstance(),
                  builder: (BuildContext buildContext, AsyncSnapshot<SharedPreferences> snapshot) {
                    if (snapshot.hasData) {
                      this.currentGroup = snapshot.data?.getString('group') ?? 'Не выбрана';
                      return Column(
                        children: [
                          Text("Группа ${this.currentGroup}"),
                          Autocomplete(
                            optionsBuilder: (TextEditingValue value) async {
                              if (value.text.length < 3) {
                                return <String>[];
                              }
                              final response = await getAutocomplete(value.text);
                              if (response.statusCode == 200) {
                                Map<String, dynamic> decoded = jsonDecode(response.body);
                                return decoded.keys;
                              }
                              else {
                                return <String>["No internet"];
                              }
                            },
                            onSelected: (String str) {
                              if (this.currentGroup != str) {
                                snapshot.data?.setString('group', str);
                                this.currentGroup = str;
                                this.setState(() {});
                              }
                            },
                          ),
                          /*TextField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.search, color: Colors.grey),
                            ),
                            onSubmitted: (string) => {
                              snapshot.data?.setString('group', string),
                              this.currentGroup = string,
                              this.setState(() {}),
                            },
                            autofocus: true,
                            autocorrect: false,
                          ),*/
                        ],
                      );
                    }
                    else {
                      return TextField(
                      );
                    }
                  },
                )
              )
            ],
          )
      );
  }
}
