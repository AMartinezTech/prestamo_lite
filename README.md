# Flutter Clean Architecture Loan Management App

Este proyecto es una aplicación Flutter diseñada para gestionar préstamos a clientes, siguiendo la **Clean Architecture**.
Incluye un enfoque modular para la escalabilidad y la mantenibilidad. La aplicación utiliza **Bloc** para el manejo del estado,
**Hive** para la persistencia de datos, **inyección de dependencias con get_it**, y **fpdart** para la programación funcional.

## Autor

**Nombre:** Alexis Martínez De La Cruz  
**Correo Electrónico:** buzonamartinez@gmail.com  
**GitHub:** [AMartinezTech](https://github.com/AMartinezTech)

---

## Características principales

- **Gestión de clientes**:
  - Cada cliente tiene un préstamo con las propiedades:
    - `id`: Identificador único.
    - `name`: Nombre del cliente.
    - `qtyQuota`: Número de cuotas.
    - `amountQuota`: Monto de cada cuota.
- **Registro de pagos**:
  - Pantalla para registrar pagos uno a la vez, mostrando detalles específicos del pago como:
    - Monto pagado.
    - Cuotas restantes.
    - Fecha del pago.
    - Concepto del pago.
- **Reporte de clientes**:
  - Resumen de los préstamos, incluyendo:
    - Total prestado.
    - Pagos realizados.
    - Balance pendiente.

---

## Tecnologías y herramientas utilizadas

### Arquitectura

- **Clean Architecture**: Diseño en capas (Domain, Data, Presentation) para una separación clara de responsabilidades.

### Manejo de Estado

- **Bloc (Business Logic Component)**: Control centralizado del estado de la aplicación.

### Programación Funcional

- **fpdart**: Implementación de programación funcional en Dart para manejar flujos de datos seguros y evitar estados inesperados.

### Persistencia

- **Hive**: Base de datos ligera y rápida para el almacenamiento local.

### Inyección de Dependencias

- **get_it**: Herramienta para inyectar y resolver dependencias en todo el proyecto.

---

## Estructura del proyecto

El proyecto está estructurado según las capas de Clean Architecture, con el módulo principal **Customer** como ejemplo de la arquitectura modular.

<!--
lib/
├── core/
│ ├── common/           # Widgets comunes como loader
│ ├── error/            # Manejo de errores de la app completa
│ ├── utils/            # Utilidades y configuraciones comunes
├── features/           # Carpeta contenedora de todas las featura ej: customer,
│       └── customer/       # Feature modular de gestión de clientes
│           └── data/       # Implementaciones concretas para repositorios y fuentes de datos
│           │     ├── datasources/        # Acceso a datos (Hive)
│           │     ├── models/             # Modelos de datos
│           │     └── repositories/       # Repositorios concretos
│           ├── domain/                   # Lógica del dominio
│           │     ├── entities/           # Entidades del dominio (Customer)
│           │     ├── repositories/       # Contratos de repositorios
│           │     └── usecases/           # Casos de uso (e.g., SaveCustomerUseCase, GetAllCustomerUseCase)
│           └── presentation/       # Capa de presentación
│                 ├── blocs/        # Manejo de estado con Bloc
│                 ├── pages/        # Pantallas (UI)
│                 ├── utils/        # Componentes comunes de cliente
│                 └── widgets/      # Widgets específicos del cliente
├── home_page.dart                  # Pantalla home contenedora del menú principal
└── main.dart                       # Punto de entrada principal -->

---

## Funcionalidades

### Gestión de Clientes

- Registrar un cliente con sus datos básicos y detalles del préstamo.
- Visualizar una lista de clientes existentes.

### Registro de Pagos

- Registrar un pago con detalles como:
  - Monto pagado.
  - Número de cuotas restantes.
  - Fecha del pago.
  - Concepto.

### Reporte de Clientes

- Generar un resumen detallado de cada cliente:
  - Total prestado.
  - Pagos realizados.
  - Balance pendiente.

---

## Dependencias

```yaml
dependencies:
  flutter:
    sdk: flutter
  bloc: ^8.1.0
  fpdart: ^1.1.1
  hive: ^2.2.3
  hive_flutter: ^1.2.0
  get_it: ^7.6.1

### Reporte de Clientes
git clone https://github.com/AMartinezTech/prestamo_lite.git
cd prestamo_lite


Este `README.md` tiene una estructura clara, incluye todos los detalles esenciales del proyecto,
y está listo para presentarse como la documentación inicial del repositorio.
```
