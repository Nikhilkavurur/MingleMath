import 'package:flutter/material.dart';
import 'dart:ui';

class StudyMaterialScreen extends StatefulWidget {
  @override
  _StudyMaterialScreenState createState() => _StudyMaterialScreenState();
}

class _StudyMaterialScreenState extends State<StudyMaterialScreen> {
  late final PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final int? chapter =
    ModalRoute.of(context)?.settings.arguments as int?;

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

    String getChapterTitle() {
      switch (chapter) {
        case 1:
          return 'N U M B E R S';
        case 2:
          return 'F O U N D A T I O N S';
        case 3:
          return 'S H A P E S';
        case 4:
          return 'S Y M B O L S';
        case 5:
          return 'G E O M E T R I C S';
        default:
          return 'Unknown Chapter';
      }
    }

    List<List<String>> spanishTranslations = [
      // Chapter 1
      [
        'Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco',
        'Seis', 'Siete', 'Ocho', 'Nueve', 'Diez',
        'Once', 'Doce', 'Trece', 'Catorce', 'Quince',
        'Dieciséis', 'Diecisiete', 'Dieciocho', 'Diecinueve', 'Veinte',
      ],
      // Chapter 2
      [
      'Número','Adición', 'Resta', 'Multiplicación', 'División', 'Igual',
      'Mayor que', 'Menor que', 'Más', 'Menos', 'Por','Dividido por',
      'Suma', 'Diferencia', 'Producto', 'Cociente', 'Fracción',
      'Decimal', 'Proporción', 'Ecuación'
      ],
      // Chapter 3
      [
      'Círculo', 'Triángulo', 'Cuadrado', 'Rectángulo', 'Rombus',
    'Paralelogramo', 'Trapecio', 'Óvalo', 'Elipse', 'Esfera',
    'Cubo', 'Cilindro', 'Cono', 'Prisma pentagonal', 'Prisma hexagonal',
    'Pirámide', 'Cuboide', 'Prisma triangular', 'Hemisferio', 'Toro',
    ],
      // Chapter 4
    [
    'Más', 'Menos', 'Igual', 'Mayor que', 'Menor que', 'Por', 'Dividido por', 'Raíz cuadrada',
    'Fracción', 'Porcentaje', 'Exponenciación', 'Sumatoria', 'Integral', 'Derivada', 'Infinito',
      'No igual a', 'Mayor o igual que', 'Menor o igual que', 'Aproximadamente igual a', 'Límite',
    ],
      // Chapter 5
    [
    "Longitud", "Ancho", "Altura", "Diámetro", "Radio", "Perímetro", "Circunferencia", "Superficie",
    "Volumen", "Ángulo", "Pendiente", "Intersección", "Simetría", "Perpendicular",
    "Paralelo", "Coordenada", "Vértice", "Eje", "Hipotenusa", "Gradiente",
    ],
    ];

    List<List<String>> englishTranslations = [
      // Chapter 1
      [
        'One', 'Two', 'Three', 'Four', 'Five',
        'Six', 'Seven', 'Eight', 'Nine', 'Ten',
        'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen',
        'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen', 'Twenty',
      ],
      // Chapter 2
      [
      'Numbers','Addition', 'Subtraction', 'Multiplication', 'Division', 'Equal',
      'Greater than', 'Less than', 'Plus', 'Minus', 'Times','Divided by',
      'Sum', 'Difference', 'Product', 'Quotient', 'Fraction',
      'Decimal', 'Ratio', 'Equation'
      ],
      // Chapter 3
      [
      'Circle', 'Triangle', 'Square', 'Rectangle', 'Rhombus',
        'Parallelogram', 'Trapezium', 'Oval', 'Ellipse', 'Sphere',
        'Cube', 'Cylinder', 'Cone', 'Pentagonal prism', 'Hexagonal prism',
        'Pyramid', 'Cuboid', 'Triangular prism', 'Hemisphere', 'Torus',
    ],
      // Chapter 4
    ['+', '-', '=', '>', '<', '×', '÷', '√', '/', '%', '^', '∑', '∫', 'd/dx', '∞', '≠', '≥', '≤', '≈', 'lim'],
      // Chapter 5
    ["Length", "Width", "Height", "Diameter", "Radius", "Perimeter", "Circumference",
      "Area", "Volume", "Angle", "Slope", "Intersection", "Symmetry", "Perpendicular", "Parallel",
      "Coordinate", "Vertex", "Axis", "Hypotenuse", "Gradient",
    ],
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'V O C A B U L A R Y',
          style: TextStyle(fontSize: 45),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            '/Users/krishna/AndroidStudioProjects/minglemath/assets/study_material.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.pinkAccent.withOpacity(0.05),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  'C H A P T E R  $chapter - ${getChapterTitle()}',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: (spanishTranslations[chapter - 1].length / 10).ceil(),
                      itemBuilder: (context, index) {
                        return buildChapterContent(
                            chapter, index, spanishTranslations, englishTranslations);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Show only 'Next' button on the first page
                if (currentPage == 0)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //primary: Colors.blue, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Increase border radius
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Add padding
                    ),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      setState(() {
                        currentPage++;
                      });
                    },
                    child: Text(
                      'N E X T',
                      style: TextStyle(fontSize: 25,color: Colors.blue), // Increase font size
                    ),
                  ),
                // Show 'Previous' and 'Exit' buttons on the last page
                if (currentPage == (spanishTranslations[chapter - 1].length / 10 - 1))
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //primary: Colors.blue, // Background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0), // Increase border radius
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Add padding
                        ),
                        onPressed: () {
                          if (currentPage > 0) {
                            _pageController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            setState(() {
                              currentPage--;
                            });
                          }
                        },
                        child: Text(
                          'P R E V I O U S',
                          style: TextStyle(fontSize: 25,color: Colors.blue), // Increase font size
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //primary: Colors.red, // Background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0), // Increase border radius
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Add padding
                        ),
                        onPressed: () {
                          // Display the 'Exit' functionality
                          Navigator.pop(context);
                        },
                        child: Text(
                          'E X I T',
                          style: TextStyle(fontSize: 25,color: Colors.red), // Increase font size
                        ),
                      ),
                    ],
                  ),
                // Show 'Next' button on all pages except the first and last
                if (currentPage > 0 && currentPage < (spanishTranslations[chapter - 1].length / 10 - 1))
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //primary: Colors.blue, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Increase border radius
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Add padding
                    ),
                    onPressed: () {
                      if (currentPage < (spanishTranslations[chapter - 1].length / 10 - 1)) {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                        setState(() {
                          currentPage++;
                        });
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 25), // Increase font size
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChapterContent(int chapter, int index, List<List<String>> spanishTranslations,
      List<List<String>> englishTranslations) {
    List<String> currentSpanishTranslations =
    spanishTranslations[chapter - 1].skip(index * 10).take(10).toList();

    List<String> currentEnglishTranslations =
    englishTranslations[chapter - 1].skip(index * 10).take(10).toList();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 120, vertical: 80),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white70.withOpacity(0.9),
            spreadRadius: 2,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Display English translations on the left side
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Center the text
                children: [
                  for (String translation in currentEnglishTranslations)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        translation,
                        style: TextStyle(fontSize: 27), // Increase font size
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(width: 20),
            // Display Spanish translations on the right side
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Center the text
                children: [
                  for (String translation in currentSpanishTranslations)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        translation,
                        style: TextStyle(fontSize: 27), // Increase font size
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
