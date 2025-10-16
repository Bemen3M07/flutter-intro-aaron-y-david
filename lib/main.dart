import 'package:flutter/material.dart'; // 2. Importa el paquete

void main() {
  runApp(const JavaVsDartApp()); 
}

class JavaVsDartApp extends StatelessWidget {
  const JavaVsDartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Java vs Dart: Diferencias Interactivas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Java vs Dart',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1976D2),
        elevation: 4,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeSection(),
            SizedBox(height: 40),
            ComparisonGrid(),
          ],
        ),
      ),
    );
  }
}

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🎓 Aprende las Diferencias',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Explora de forma interactiva cómo Dart mejora conceptos de Java',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class ComparisonGrid extends StatelessWidget {
  const ComparisonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = [ // Lo hacemos sin declarar List<ComparisonTopic> explícitamente 
      ComparisonTopic(
        title: 'const vs final',
        description: 'Diferencias en inmutabilidad',
        icon: Icons.lock,
        color: const Color(0xFF4CAF50),
        onTap: () => _showComparison(context, 'const_final'), // Utilización de lambda
      ),
      ComparisonTopic(
        title: 'Constructores',
        description: 'Sintaxis y características',
        icon: Icons.build,
        color: const Color(0xFF2196F3),
        onTap: () => _showComparison(context, 'constructors'), // Utilización de lambda
      ),
      ComparisonTopic(
        title: 'Parámetros',
        description: 'Named, optional y defaults',
        icon: Icons.settings,
        color: const Color(0xFFFF9800),
        onTap: () => _showComparison(context, 'parameters'), // Utilización de lambda
      ),
      ComparisonTopic(
        title: 'Funciones',
        description: 'Lambdas y funciones flecha',
        icon: Icons.functions,
        color: const Color(0xFF9C27B0),
        onTap: () => _showComparison(context, 'functions'), // Utilización de lambda
      ),
      ComparisonTopic(
        title: 'Genéricos',
        description: 'Tipos y sintaxis',
        icon: Icons.code,
        color: const Color(0xFFE91E63),
        onTap: () => _showComparison(context, 'generics'), // Utilización de lambda
      ),
      ComparisonTopic(
        title: 'Paquetes',
        description: 'Imports y libraries',
        icon: Icons.folder,
        color: const Color(0xFF795548),
        onTap: () => _showComparison(context, 'packages'), // Utilización de lambda
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemCount: topics.length,
      itemBuilder: (context, index) => TopicCard(topic: topics[index]), // Utilización de lambda
    );
  }

  void _showComparison(BuildContext context, String type) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ComparisonDetailScreen(type: type), // Utilización de lambda
      ),
    );
  }
}

class ComparisonTopic {
  final String title;  // Utilización de finals
  final String description; // Utilización de finals
  final IconData icon; // Utilización de finals
  final Color color; // Utilización de finals
  final VoidCallback onTap; // Utilización de finals

  const ComparisonTopic({ // Utilización de const
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}

class TopicCard extends StatelessWidget {
  final ComparisonTopic topic;

  const TopicCard({
    super.key,
    required this.topic,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: topic.onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                topic.icon,
                size: 40,
                color: topic.color,
              ),
              const SizedBox(height: 12),
              Text(
                topic.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  topic.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ComparisonDetailScreen extends StatelessWidget {
  final String type;

  const ComparisonDetailScreen({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: _getContent(),
      ),
    );
  }

  String _getTitle() {
    switch (type) {
      case 'const_final':
        return 'const vs final';
      case 'constructors':
        return 'Constructores';
      case 'parameters':
        return 'Parámetros';
      case 'functions':
        return 'Funciones';
      case 'generics':
        return 'Genéricos';
      case 'packages':
        return 'Paquetes';
      default:
        return 'Comparación';
    }
  }

  Widget _getContent() {
    switch (type) {
      case 'const_final':
        return const ConstFinalComparison();
      case 'constructors':
        return const ConstructorsComparison();
      case 'parameters':
        return const ParametersComparison();
      case 'functions':
        return const FunctionsComparison();
      case 'generics':
        return const GenericsComparison();
      case 'packages':
        return const PackagesComparison();
      default:
        return const Text('Contenido en desarrollo...');
    }
  }
}

// Widget base para comparaciones
class ComparisonCard extends StatelessWidget {
  final String title;
  final String javaCode;
  final String dartCode;
  final String explanation;
  final Color accentColor;

  const ComparisonCard({
    super.key,
    required this.title,
    required this.javaCode,
    required this.dartCode,
    required this.explanation,
    this.accentColor = const Color(0xFF2196F3),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CodeBlock(
                        title: 'Java',
                        code: javaCode,
                        color: const Color(0xFFFF6B35),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CodeBlock(
                        title: 'Dart',
                        code: dartCode,
                        color: const Color(0xFF00D2FF),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(8),
                    border: Border(
                      left: BorderSide(
                        width: 4,
                        color: accentColor,
                      ),
                    ),
                  ),
                  child: Text(
                    explanation,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: Color(0xFF555555),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CodeBlock extends StatelessWidget {
  final String title;
  final String code;
  final Color color;

  const CodeBlock({
    super.key,
    required this.title,
    required this.code,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF2D2D2D),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(6),
              topRight: Radius.circular(6),
            ),
          ),
          child: Text(
            code,
            style: const TextStyle(
              fontFamily: 'Courier',
              fontSize: 12,
              color: Color(0xFFE0E0E0),
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

// Comparaciones específicas
class ConstFinalComparison extends StatelessWidget {
  const ConstFinalComparison({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ComparisonCard(
          title: 'Definición de constantes',
          javaCode: '''// Java
final String nombre = "Juan";
final List<String> lista = new ArrayList<>();

// No se puede cambiar la referencia,
// pero sí el contenido
lista.add("elemento");''',
          dartCode: '''// Dart
final String nombre = "Juan";
const String apellido = "Pérez";

final List<String> lista = ["elemento"];
const List<String> listaConst = ["fijo"];

// const es compile-time constant''',
          explanation: 'En Dart, "const" crea constantes en tiempo de compilación, mientras que "final" permite valores que se conocen solo en tiempo de ejecución. Java solo tiene "final".',
          accentColor: Color(0xFF4CAF50),
        ),
        ComparisonCard(
          title: 'Inmutabilidad profunda',
          javaCode: '''// Java
final List<String> lista = new ArrayList<>();
lista.add("cambio"); // ✅ Permitido

// Para inmutabilidad:
final List<String> inmutable = 
    Collections.unmodifiableList(lista);''',
          dartCode: '''// Dart
final List<String> lista = ["elemento"];
lista.add("cambio"); // ✅ Permitido

const List<String> listaConst = ["fijo"];
// listaConst.add("x"); // ❌ Error!''',
          explanation: 'Dart const garantiza inmutabilidad profunda automáticamente, mientras que Java requiere métodos adicionales como Collections.unmodifiableList().',
          accentColor: Color(0xFF4CAF50),
        ),
      ],
    );
  }
}

class ConstructorsComparison extends StatelessWidget {
  const ConstructorsComparison({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ComparisonCard(
          title: 'Constructores básicos',
          javaCode: '''// Java
public class Persona {
    private String nombre;
    private int edad;
    
    public Persona(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }
}''',
          dartCode: '''// Dart
class Persona {
  final String nombre;
  final int edad;
  
  Persona(this.nombre, this.edad);
  
  // O más explícito:
  // Persona(String nombre, int edad)
  //   : this.nombre = nombre,
  //     this.edad = edad;
}''',
          explanation: 'Dart permite la sintaxis this.parameter para asignar directamente a campos, eliminando código repetitivo.',
          accentColor: Color(0xFF2196F3),
        ),
        ComparisonCard(
          title: 'Constructores con nombre',
          javaCode: '''// Java
public class Persona {
    // Se usan métodos factory estáticos
    public static Persona crearAdulto(String nombre) {
        return new Persona(nombre, 18);
    }
    
    public static Persona crearBebe(String nombre) {
        return new Persona(nombre, 0);
    }
}''',
          dartCode: '''// Dart
class Persona {
  final String nombre;
  final int edad;
  
  Persona(this.nombre, this.edad);
  
  // Constructores con nombre
  Persona.adulto(this.nombre) : edad = 18;
  Persona.bebe(this.nombre) : edad = 0;
}''',
          explanation: 'Dart soporta múltiples constructores con nombres descriptivos directamente en la clase, sin necesidad de métodos factory.',
          accentColor: Color(0xFF2196F3),
        ),
      ],
    );
  }
}

class ParametersComparison extends StatelessWidget {
  const ParametersComparison({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ComparisonCard(
          title: 'Parámetros con nombre',
          javaCode: '''// Java
// No hay parámetros con nombre nativos
public void crearUsuario(String nombre, 
                        int edad, 
                        String email) {
    // implementación
}

// Uso:
crearUsuario("Juan", 25, "juan@email.com");''',
          dartCode: '''// Dart
void crearUsuario({
  required String nombre,
  required int edad,
  String? email,
}) {
  // implementación
}

// Uso:
crearUsuario(
  nombre: "Juan",
  edad: 25,
  email: "juan@email.com",
);''',
          explanation: 'Dart tiene parámetros con nombre nativos que hacen el código más legible y menos propenso a errores de orden.',
          accentColor: Color(0xFFFF9800),
        ),
        ComparisonCard(
          title: 'Parámetros opcionales',
          javaCode: '''// Java
// Se usan sobrecarga de métodos
public void saludar(String nombre) {
    saludar(nombre, "Buenos días");
}

public void saludar(String nombre, String saludo) {
    System.out.println(saludo + ", " + nombre);
}''',
          dartCode: '''// Dart
// Parámetros opcionales posicionales
void saludar(String nombre, [String saludo = "Buenos días"]) {
  print('\$saludo, \$nombre');
}

// Parámetros opcionales con nombre
void saludarConNombre({
  required String nombre,
  String saludo = "Buenos días",
}) {
  print('\$saludo, \$nombre');
}''',
          explanation: 'Dart permite parámetros opcionales tanto posicionales como con nombre, eliminando la necesidad de sobrecarga de métodos.',
          accentColor: Color(0xFFFF9800),
        ),
      ],
    );
  }
}

class FunctionsComparison extends StatelessWidget {
  const FunctionsComparison({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ComparisonCard(
          title: 'Funciones lambda',
          javaCode: '''// Java 8+
List<Integer> numeros = Arrays.asList(1, 2, 3, 4, 5);

List<Integer> pares = numeros.stream()
    .filter(n -> n % 2 == 0)
    .collect(Collectors.toList());

// Función con múltiples líneas
Function<Integer, String> formatear = (numero) -> {
    return "Número: " + numero;
};''',
          dartCode: '''// Dart
List<int> numeros = [1, 2, 3, 4, 5];

List<int> pares = numeros
    .where((n) => n % 2 == 0)
    .toList();

// Función flecha simple
String formatear(int numero) => "Número: \$numero";

// También funciona con variables
var formatearVar = (int numero) => "Número: \$numero";''',
          explanation: 'Dart tiene una sintaxis más concisa para funciones flecha y no requiere streams para operaciones simples sobre colecciones.',
          accentColor: Color(0xFF9C27B0),
        ),
        ComparisonCard(
          title: 'Funciones como parámetros',
          javaCode: '''// Java
public interface Callback {
    void ejecutar(String resultado);
}

public void procesar(String datos, Callback callback) {
    String resultado = datos.toUpperCase();
    callback.ejecutar(resultado);
}

// Uso:
procesar("hola", resultado -> 
    System.out.println("Resultado: " + resultado));''',
          dartCode: '''// Dart
void procesar(String datos, void Function(String) callback) {
  String resultado = datos.toUpperCase();
  callback(resultado);
}

// Uso más simple:
procesar("hola", (resultado) {
  print("Resultado: \$resultado");
});

// O con función flecha:
procesar("hola", (resultado) => print("Resultado: \$resultado"));''',
          explanation: 'Dart trata las funciones como ciudadanos de primera clase sin necesidad de interfaces adicionales.',
          accentColor: Color(0xFF9C27B0),
        ),
      ],
    );
  }
}

class GenericsComparison extends StatelessWidget {
  const GenericsComparison({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ComparisonCard(
          title: 'Sintaxis de genéricos',
          javaCode: '''// Java
public class Contenedor<T> {
    private T contenido;
    
    public void setContenido(T contenido) {
        this.contenido = contenido;
    }
    
    public T getContenido() {
        return contenido;
    }
}

// Uso:
Contenedor<String> contenedor = new Contenedor<String>();''',
          dartCode: '''// Dart
class Contenedor<T> {
  T? contenido;
  
  void setContenido(T contenido) {
    this.contenido = contenido;
  }
  
  T? getContenido() => contenido;
}

// Uso:
var contenedor = Contenedor<String>();
// O con inferencia de tipos:
Contenedor<String> contenedor2 = Contenedor();''',
          explanation: 'Dart tiene mejor inferencia de tipos y sintaxis más limpia para genéricos, eliminando redundancia.',
          accentColor: Color(0xFFE91E63),
        ),
        ComparisonCard(
          title: 'Funciones genéricas',
          javaCode: '''// Java
public <T> T obtenerPrimero(List<T> lista) {
    if (lista.isEmpty()) {
        return null;
    }
    return lista.get(0);
}

// Uso:
String primero = obtenerPrimero(Arrays.asList("a", "b", "c"));''',
          dartCode: '''// Dart
T? obtenerPrimero<T>(List<T> lista) {
  if (lista.isEmpty) {
    return null;
  }
  return lista.first;
}

// Uso:
String? primero = obtenerPrimero(["a", "b", "c"]);
// Con inferencia:
var primero2 = obtenerPrimero(["a", "b", "c"]);''',
          explanation: 'Dart coloca los genéricos después del nombre de función, similar a TypeScript, y tiene mejor inferencia automática.',
          accentColor: Color(0xFFE91E63),
        ),
      ],
    );
  }
}

class PackagesComparison extends StatelessWidget {
  const PackagesComparison({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ComparisonCard(
          title: 'Imports y paquetes',
          javaCode: '''// Java
package com.ejemplo.proyecto;

import java.util.List;
import java.util.ArrayList;
import com.ejemplo.otrapaquete.ClaseExterna;

public class MiClase {
    private List<String> elementos = new ArrayList<>();
}''',
          dartCode: '''// Dart
// library opcional
library mi_proyecto;

import 'dart:core'; // Implícito
import 'package:flutter/material.dart';
import 'mi_archivo.dart';

class MiClase {
  final List<String> elementos = <String>[];
}''',
          explanation: 'Dart no requiere declaración de package en cada archivo. Los imports son más simples y flexibles.',
          accentColor: Color(0xFF795548),
        ),
        ComparisonCard(
          title: 'Visibilidad y exports',
          javaCode: '''// Java
package com.ejemplo;

public class ClasePublica {
    private int privado;
    protected int protegido;
    public int publico;
    int paqueteLocal; // package-private
}''',
          dartCode: '''// Dart
class ClasePublica {
  int _privado = 0;     // Privado (por convención)
  int publico = 0;      // Público
}

// En un archivo separado para exportar:
// export 'mi_archivo.dart' show ClasePublica;
// export 'otro.dart' hide ClaseInterna;''',
          explanation: 'Dart usa _ para privacidad y tiene un sistema más flexible de exports con show/hide selectivos.',
          accentColor: Color(0xFF795548),
        ),
      ],
    );
  }
}
