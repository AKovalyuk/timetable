import 'package:flutter/material.dart';

class NoteModal extends StatefulWidget {
  const NoteModal({super.key});

  @override
  State<NoteModal> createState() => _NoteModalState();
}

class _NoteModalState extends State<NoteModal> {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        toolbarOpacity: 1,
      ),
      body: Container(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                        onPressed: () {
                          Navigator.pop(buildContext);
                        },
                        child: Icon(Icons.arrow_back, color: Colors.grey)
                    ),
                    FloatingActionButton(
                        onPressed: () {
                          Navigator.pop(buildContext);
                        },
                        child: Icon(Icons.close, color: Colors.grey)
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Вторник, 33 февраля"),
                    Text(''),
                    Text("Название предмета"),
                    Text(''),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: const Color(0xFF777777))
                        ),
                        fillColor: Color(0xFFC9C9C9),
                        filled: true
                      ),
                      minLines: 8,
                      maxLines: 8,
                    ),
                    Text(''),
                    ElevatedButton(
                      onPressed: (){},
                      child: Text(
                        'Сохранить',
                        style: TextStyle(
                          color: const Color(0xFF777777)
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}