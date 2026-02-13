import 'package:flutter/material.dart';

void main() => runApp(const StarMedica());

class StarMedica extends StatelessWidget {
  const StarMedica({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Star Medica",
      home: Doctores(),
    );
  }
}

class Doctores extends StatelessWidget {
  const Doctores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AHR Star Medica",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[300], // Azul moderno
        actions: [
          IconButton(
            icon: const Icon(Icons.medical_services, color: Colors.white),
            onPressed: () {},
            tooltip: 'Servicios',
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {},
            tooltip: 'Perfil',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Primera Fila: Directorio y Urgencias
              buildRow(
                "Directorio Médico", Icons.people_outline, Colors.blue,
                "Urgencias", Icons.local_hospital, Colors.pinkAccent,
              ),
              // Segunda Fila: Citas y Resultados
              buildRow(
                "Agendar Cita", Icons.calendar_today_outlined, Colors.red,
                "Resultados", Icons.science_outlined, Colors.white,
              ),
              // Tercera Fila: Farmacia y Contacto
              buildRow(
                "Farmacia", Icons.local_pharmacy_outlined, const Color(0xFFF5F5DC),
                "Contacto", Icons.contact_phone_outlined, Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método auxiliar para crear las filas con iconos
  Widget buildRow(String text1, IconData icon1, Color color1, String text2, IconData icon2, Color color2) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(child: CustomContainer(text: text1, icon: icon1, color: color1)),
            const SizedBox(width: 16),
            Expanded(child: CustomContainer(text: text2, icon: icon2, color: color2)),
          ],
        ),
      ),
    );
  }
}

// Widget personalizado para los contenedores con iconos
class CustomContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;

  const CustomContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Determinar el color del texto y del icono para asegurar el contraste
    final bool isLightColor = color == Colors.white || color.value == 0xFFF5F5DC;
    final Color contentColor = isLightColor ? Colors.black : Colors.white;

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
        border: isLightColor ? Border.all(color: Colors.grey.shade300) : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: contentColor),
          const SizedBox(height: 12),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: contentColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
