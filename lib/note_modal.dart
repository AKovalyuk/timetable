import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteModal extends StatefulWidget {
  int id;
  String lessonName;
  NoteModal({super.key, required this.id, required this.lessonName});

  @override
  State<NoteModal> createState() => _NoteModalState();
}

class _NoteModalState extends State<NoteModal> {
  String value='';

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        toolbarOpacity: 1,
      ),
      body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                        onPressed: () {
                          Navigator.pop(buildContext);
                        },
                        child: const Icon(Icons.arrow_back, color: Colors.grey)
                    ),
                    FloatingActionButton(
                        onPressed: () {
                          Navigator.pop(buildContext);
                        },
                        child: const Icon(Icons.close, color: Colors.grey)
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Вторник, 33 февраля"),
                    const Text(''),
                    Text(this.widget.lessonName),
                    const Text(''),
                    FutureBuilder(
                        future: SharedPreferences.getInstance(),
                        builder: (BuildContext buildContext, AsyncSnapshot<SharedPreferences> snapshot) {
                          if (snapshot.hasData) {
                            String? initial = snapshot.data?.getString('notes_${snapshot.data?.getString('group')}_${widget.id}') ?? '';
                            return TextField(
                              controller: TextEditingController(
                                  text: initial
                              ),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF777777))
                                  ),
                                  fillColor: Color(0xFFC9C9C9),
                                  filled: true
                              ),
                              onChanged: (String val) {
                                this.value = val;
                              },
                              minLines: 8,
                              maxLines: 8,
                            );
                          }
                          else {
                            return Text('');
                          }
                        }
                    ),
                    const Text(''),
                    ElevatedButton(
                      onPressed: () async {
                        var prefs = await SharedPreferences.getInstance();
                        var group = prefs.getString('group');
                        print(this.value);
                        prefs.setString('notes_${group}_${widget.id}', this.value);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white
                      ),
                      child: const Text(
                      'Сохранить',
                      style: TextStyle(
                          color: Color(0xFF777777)
                      ),
                    ),
                    )
                  ],
                ),
              )
            ],
          )
    );
  }
}