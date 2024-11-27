import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String title; // Título del ListTile
  final String subtitle; // Subtítulo del ListTile
  final VoidCallback onButtonPressed; // Función para el botón
  final IconData icon; // Ícono personalizado para el ListTile
  final String buttonText; // Texto del botón

  const MenuButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onButtonPressed,
    this.icon = Icons.accessibility_new, // Ícono por defecto
    this.buttonText = "crear", // Texto por defecto del botón
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400, // Ancho fijo
      height: 150, // Alto fijo
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: const Color.fromARGB(255, 203, 231, 175),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(icon,
                    size: 40, color: const Color.fromARGB(255, 33, 70, 35)),
                title: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 158, 158, 158),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onButtonPressed,
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.white60),
                    ),
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}


// return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(fixedSize: const Size(250, 100)),
      
//       child: IconButton(onPressed: onPressed, icon: icon)