import 'package:flutter/material.dart';
// main
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '183213',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  // Ги дефинирав сите предмети во една листа
  List<String> classes = [
    'Тимски проект',
    'Менаџмент на информациски системи',
    'Програмирање на видео игри',
    'Администрација на системи',
    'Мобилни информаиски системи'
  ];

  // Контролер кој го користам при додавање на нов предмет
  final TextEditingController _controller = TextEditingController();

  // Метода која ја користам при додавање на нов предмет
  void _addClass() {
    setState(() {
      String text = _controller.text;
      classes.add(text);
    });
  }

  // Метода која ја користам при бришење на предмет
  void _deleteClass(index) {
    setState(() {
      classes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Тука го додадов индексот
        title: const Text('183213'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: classes.length,
          itemBuilder: (BuildContext context, int index) {
            // Ги прикажувам сите курсеви кои се во листата
            return ListTile(
              title: Text(classes[index]),
                // Копче за бришење на предмет!
                trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  _deleteClass(index);
                },
              )
            );
          },
        ),
      ),

      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              // Текстот беше надвор од екранот па со помош на padding го поправив.
              padding: const EdgeInsets.only(left: 30),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Додади нов предмет!',
                ),
              ),
            ),
          ),
          // Да има простор помеѓу копчето и TextField
          const SizedBox(width: 10),
          FloatingActionButton(
            // Кога ќе се кликне на копчето повикај ја методата _addClass
            onPressed: _addClass,
            tooltip: 'Додади нов предмет',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
