import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameData()),
      ],
      child: MaterialApp(
        home: MatchGame(),
      ),
    ),
  );
}

class GameData extends ChangeNotifier {
  int total = 0; // Initialize total

  void setTotal(int value) {
    total += value; // Update total by adding the current game score
    notifyListeners();
  }
}

class MatchGame extends StatefulWidget {
  @override
  _MatchGameState createState() => _MatchGameState();
}

class _MatchGameState extends State<MatchGame> {
  late List<ItemModel> items;
  late List<ItemModel> items2;

  int score = 0;
  bool gameOver = false;
  bool isGameStarted = false; // Added variable to track if the game has started
  int? chapter;
  late GameData gameData;

  @override
  Widget build(BuildContext context) {
    chapter = ModalRoute.of(context)?.settings.arguments as int?;

    if (chapter == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error: Chapter not provided.'),
        ),
      );
    }

    if (!isGameStarted) {
      // Display a loading indicator or a start button until the game starts
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("/Users/krishna/AndroidStudioProjects/minglemath/assets/forest.gif"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'J U N G L E    M A T C H I N G    S A F A R I',
                  style: TextStyle(fontSize: 45, color: Colors.white),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        //primary: Colors.greenAccent, // Set an inviting color
                        padding: EdgeInsets.all(32.0), // Increase button padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {
                        startGame(chapter!);
                      },
                      child: Text(
                        'Start Game',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        //primary: Colors.blue, // Set an inviting color
                        padding: EdgeInsets.all(32.0), // Increase button padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Exit the screen
                      },
                      child: Text(
                        'Exit',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (items.isEmpty) gameOver = true;
    if (gameOver) {
      Future.delayed(Duration.zero, () {
        Provider.of<GameData>(context, listen: false).setTotal(score);
      });
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'J U N G L E    M A T C H I N G    S A F A R I',
          style: TextStyle(fontSize: 45),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("/Users/krishna/AndroidStudioProjects/minglemath/assets/forest.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "S C O R E : ",
                      style: TextStyle(
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                  TextSpan(
                    text: "$score",
                    style: TextStyle(
                      color: Colors.yellowAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  )
                ])),
                if (!gameOver)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: items.map((item) {
                          return Container(
                            width: 150, // Adjusted width
                            height: 150, // Adjusted height
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.white70, width: 2.0),
                            ),
                            child: Center(
                              child: Draggable<ItemModel>(
                                data: item,
                                childWhenDragging: Container(),
                                feedback: Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: Colors.white70, width: 2.0),
                                  ),
                                  child: Text(
                                    item.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: Colors.white70, width: 2.0),
                                  ),
                                  child: Text(
                                    item.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Spacer(),
                      Column(
                        children: items2.map((item) {
                          return Container(
                            width: 150, // Adjusted width
                            height: 150, // Adjusted height
                            child: DragTarget<ItemModel>(
                              onAccept: (receivedItem) {
                                if (item.value == receivedItem.value) {
                                  setState(() {
                                    items.remove(receivedItem);
                                    items2.remove(item);
                                    score += 2; // Increase score by 2 if correct
                                    item.accepting = false;
                                  });
                                } else {
                                  setState(() {
                                    score -= 1; // Reduce score by 1 if wrong
                                    item.accepting = false;
                                  });
                                }
                              },
                              onLeave: (receivedItem) {
                                setState(() {
                                  item.accepting = false;
                                });
                              },
                              onWillAccept: (receivedItem) {
                                setState(() {
                                  item.accepting = true;
                                });
                                return true;
                              },
                              builder: (context, acceptedItems, rejectedItem) => Container(
                                decoration: BoxDecoration(
                                  color: item.accepting ? Colors.red : Colors.white70,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: Colors.white, width: 2.0),
                                ),
                                height: 150, // Adjusted height
                                width: 150, // Adjusted width
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(8.0),
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                if (gameOver)
                  Text(
                    "G a m e  O v e r",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                if (gameOver)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjusted spacing
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //primary: Colors.pink,
                          padding: EdgeInsets.all(16.0), // Increased button padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          startGame(chapter!);
                        },
                        child: Text(
                          "New Game",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //primary: Colors.blue,
                          padding: EdgeInsets.all(16.0), // Increased button padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Exit",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    items = [];
    items2 = [];
  }

  void startGame(int chapter) {
    setState(() {
      isGameStarted = true;
      gameOver = false;
      score = 0;
      initGame(chapter: chapter);
    });
  }

  bool initialized = false; // Add this variable at the top of your State class

  void initGame({required int chapter}) {
    List<int> randomIndices = List.generate(20, (index) => index)..shuffle();

    setState(() {
      switch (chapter) {
        case 1:
          items = List.generate(5, (index) {
            int randomIndex = randomIndices[index];
            return ItemModel(name: spanishCH1[randomIndex], value: englishCH1[randomIndex]);
          });
          break;
        case 2:
          items = List.generate(5, (index) {
            int randomIndex = randomIndices[index];
            return ItemModel(name: spanishCH2[randomIndex], value: englishCH2[randomIndex]);
          });
          break;
        case 3:
          items = List.generate(5, (index) {
            int randomIndex = randomIndices[index];
            return ItemModel(name: spanishCH3[randomIndex], value: englishCH3[randomIndex]);
          });
          break;
        case 4:
          items = List.generate(5, (index) {
            int randomIndex = randomIndices[index];
            return ItemModel(name: spanishCH4[randomIndex], value: englishCH4[randomIndex]);
          });
          break;
        case 5:
          items = List.generate(5, (index) {
            int randomIndex = randomIndices[index];
            return ItemModel(name: spanishCH5[randomIndex], value: englishCH5[randomIndex]);
          });
          break;
        default:
        // Handle default case or provide a default list
          break;
      }

      items2 = List<ItemModel>.from(items);
      items.shuffle();
      items2.shuffle();
    });
  }

  // Define lists for different chapters
  List<String> spanishCH1 = [
    "Uno",
    "Dos",
    "Tres",
    "Cuatro",
    "Cinco",
    "Seis",
    "Siete",
    "Ocho",
    "Nueve",
    "Diez",
    "Once",
    "Doce",
    "Trece",
    "Catorce",
    "Quince",
    "Dieciséis",
    "Diecisiete",
    "Dieciocho",
    "Diecinueve",
    "Veinte"
  ];

  List<String> englishCH1 = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "Nine",
    "Ten",
    "Eleven",
    "Twelve",
    "Thirteen",
    "Fourteen",
    "Fifteen",
    "Sixteen",
    "Seventeen",
    "Eighteen",
    "Nineteen",
    "Twenty"
  ];

  List<String> spanishCH2 = [
    'Número',
    'Adición',
    'Resta',
    'Multiplicación',
    'División',
    'Igual',
    'Mayor que',
    'Menor que',
    'Más',
    'Menos',
    'Por',
    'Dividido por',
    'Suma',
    'Diferencia',
    'Producto',
    'Cociente',
    'Fracción',
    'Decimal',
    'Proporción',
    'Ecuación'
  ];
  List<String> englishCH2 = [
    'Numbers',
    'Addition',
    'Subtraction',
    'Multiplication',
    'Division',
    'Equal',
    'Greater than',
    'Less than',
    'Plus',
    'Minus',
    'Times',
    'Divided by',
    'Sum',
    'Difference',
    'Product',
    'Quotient',
    'Fraction',
    'Decimal',
    'Ratio',
    'Equation'
  ];

  List<String> spanishCH3 = [
    'Círculo',
    'Triángulo',
    'Cuadrado',
    'Rectángulo',
    'Rombus',
    'Paralelogramo',
    'Trapecio',
    'Óvalo',
    'Elipse',
    'Esfera',
    'Cubo',
    'Cilindro',
    'Cono',
    'Prisma pentagonal',
    'Prisma hexagonal',
    'Pirámide',
    'Cuboide',
    'Prisma triangular',
    'Hemisferio',
    'Toro',
  ];
  List<String> englishCH3 = [
    'Circle',
    'Triangle',
    'Square',
    'Rectangle',
    'Rhombus',
    'Parallelogram',
    'Trapezium',
    'Oval',
    'Ellipse',
    'Sphere',
    'Cube',
    'Cylinder',
    'Cone',
    'Pentagonal prism',
    'Hexagonal prism',
    'Pyramid',
    'Cuboid',
    'Triangular prism',
    'Hemisphere',
    'Torus',
  ];

  List<String> spanishCH4 = [
    'Más',
    'Menos',
    'Igual',
    'Mayor que',
    'Menor que',
    'Por',
    'Dividido por',
    'Raíz cuadrada',
    'Fracción',
    'Porcentaje',
    'Exponenciación',
    'Sumatoria',
    'Integral',
    'Derivada',
    'Infinito',
    'No igual a',
    'Mayor o igual que',
    'Menor o igual que',
    'Aproximadamente igual a',
    'Límite',
  ];
  List<String> englishCH4 = [
    '+',
    '-',
    '=',
    '>',
    '<',
    '×',
    '÷',
    '√',
    '/',
    '%',
    '^',
    '∑',
    '∫',
    'd/dx',
    '∞',
    '≠',
    '≥',
    '≤',
    '≈',
    'lim'
  ];

  List<String> spanishCH5 = [
    "Longitud",
    "Ancho",
    "Altura",
    "Diámetro",
    "Radio",
    "Perímetro",
    "Circunferencia",
    "Superficie",
    "Volumen",
    "Ángulo",
    "Pendiente",
    "Intersección",
    "Simetría",
    "Perpendicular",
    "Paralelo",
    "Coordenada",
    "Vértice",
    "Eje",
    "Hipotenusa",
    "Gradiente",
  ];
  List<String> englishCH5 = [
    "Length",
    "Width",
    "Height",
    "Diameter",
    "Radius",
    "Perimeter",
    "Circumference",
    "Area",
    "Volume",
    "Angle",
    "Slope",
    "Intersection",
    "Symmetry",
    "Perpendicular",
    "Parallel",
    "Coordinate",
    "Vertex",
    "Axis",
    "Hypotenuse",
    "Gradient",
  ];
}

class ItemModel {
  final String name;
  final String value;
  bool accepting;

  ItemModel({required this.name, required this.value, this.accepting = false});
}
