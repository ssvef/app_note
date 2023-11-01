import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Notes App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter =1;
  String noteContent="";// contenido de la nota a guardar
  String noteMsg ="The list is empty."; // impresion de la tarjeta con el contador y nota (notecontent)
  final _tempNote= TextEditingController();

   void notes() {
    setState(() {
      String tempNoteContent=noteContent;// temporal
      if(tempNoteContent.isNotEmpty && tempNoteContent != ""){
         noteMsg ="Note #$counter\n$noteContent".replaceAll("|", "\n");
        counter++;
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Center(
          child: ListView(
            children: [
              const Text(
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                'Please enter the note to save',
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
              controller: _tempNote,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Write your note here..."),
              ),
              const SizedBox(
                height: 20.0,
              ),
              FilledButton(
                onPressed: (){
                  noteContent = _tempNote.text;
                  _tempNote.clear();
                  notes();
                },
                child: const Text('Save'),
              ),
              Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Card(
                    child: ListTile(
                      minVerticalPadding: 10,
                      title: const Text('Notes List',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, height:3)),
                      subtitle: Text(noteMsg,
                      //code completo notes();

                      ),
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
