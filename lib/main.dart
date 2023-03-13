import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GFG(),
    );
  }
}

class GFG extends StatefulWidget {
  const GFG({Key? key}) : super(key: key);

  @override
  State<GFG> createState() => _GFGState();
}

class _GFGState extends State<GFG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              }),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5)),
                onPressed: () {},
                child: const Text('Listas de Alexa',
                    style: TextStyle(color: Colors.black))),
            TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5)),
                onPressed: () {},
                child:
                    const Text('Prime', style: TextStyle(color: Colors.black))),
            TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5)),
                onPressed: () {},
                child:
                    const Text('Video', style: TextStyle(color: Colors.black))),
            TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5)),
                onPressed: () {},
                child: const Text('Musica',
                    style: TextStyle(color: Colors.black))),
          ]),
          Row(
            children: const [
              Icon(Icons.location_on),
              Text("Compras desde Monterrey 64760?")
            ],
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset('images/first.png')]),
          Row(
            children: [
              Expanded(
                  child: Card(
                      child: SizedBox(
                height: 200,
                width: 300,
                child: Column(children: [
                  const ListTile(
                    title: Text('Bienvenido'),
                    subtitle:
                        Text('Inicia sesion para vivir tu mejor experiencia'),
                  ),
                  Column(
                    children: <Widget>[
                      Column(
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  backgroundColor:
                                      const Color.fromARGB(255, 201, 186, 52)),
                              onPressed: () {},
                              child:
                                  const Text('Iniciar sesion de forma segura')),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('Crear una cuenta'),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 8),
                        ],
                      )
                    ],
                  )
                ]),
              ))),
              Expanded(
                  child: Card(
                child: SizedBox(
                  height: 200,
                  width: 100,
                  child: Column(children: [
                    const ListTile(title: Text('Seguir comprando')),
                    Image.asset('images/flowers.jpg', height: 100, width: 50),
                  ]),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/second.jpg',
            ),
          ),
          SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/three.png',
            ),
          ),
        ]),
      ),
      appBar: AppBar(
        title: const Text(
          "Amazon",
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.black,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_off_outlined),
            backgroundColor: Colors.black,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop_outlined),
            backgroundColor: Colors.black,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
            backgroundColor: Colors.black,
            label: '',
          )
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
