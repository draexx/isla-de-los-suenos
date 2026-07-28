## 📌 Descripción del Proyecto

**La Isla de los Sueños** es una plataforma de videojuego educativo e interactivo diseñada para niños en etapa de educación inicial (4 a 5 años / 2.ª sección de kínder). El proyecto combina el aprendizaje curricular con la exploración lúdica en una **Isla Voladora** dividida en cuatro biomas temáticos:

* 🍊 **El Bosque de los Frutos (Matemáticas):** Conteo, seriación, clasificación de formas/colores y adición temprana.
* 🦉 **La Fogata Nocturna (Lenguaje y Comunicación):** Discriminación auditiva, rimas y trazado inicial de vocales.
* 🐻 **El Volcán y la Selva (Ciencias Naturales):** Esquema corporal, adaptación al clima y cuidado del entorno.
* 🪅 **La Aldea Tradicional (Ciencias Sociales):** Identidad familiar, tradiciones culturales y educación vial inicial.

### 🛠️ Características Principales
* **Estética Diorama Troquelado (2.5D):** Construcción por capas `Sprite3D` con paralaje y movimiento de flotación senoidal continuo.
* **Mecánica del Quirquincho:** Personaje guía que se enrolla en pelota 2.5D para rodar por las casillas del tablero.
* **Sistema de Florecimiento (Sin Castigos):** Progreso basado en recompensas visuales y personalización del diorama mediante decoraciones e iluminación dinámica.
* **Multiplataforma:** Desarrollado en Godot 4, optimizado para entornos táctiles (Android/iOS) y ejecutables (PC/Web).

---

## Estado actual del repositorio

Este repositorio contiene un **prototipo técnico inicial** de la isla flotante y su interacción base.

### Lo que ya está implementado
* Escena principal en 3D (`Node3D`) con raíz de isla flotante.
* Movimiento vertical senoidal para simular flotación continua.
* Rotación interactiva de la isla mediante arrastre (mouse y touch).
* Suavizado de rotación para mantener el efecto diorama.
* Configuración de render en perfil mobile de Godot 4.7.

### Lo que aún no está implementado
* División jugable en los cuatro biomas descritos.
* Minijuegos educativos por área curricular.
* Personaje del quirquincho con mecánicas de progreso.
* Sistema de florecimiento, recompensas y personalización.
* HUD/UI, audio, guardado de progreso y navegación de escenas.

## Estructura del proyecto

```text
.
├── FloatingIsland.tscn
├── project.godot
├── scripts/
│   └── floating_island.gd
├── icon.svg
└── README.md
```

## Detalles técnicos actuales

### Escena principal
* `FloatingIsland.tscn` define:
	* `MainGame` (`Node3D`) como nodo raíz.
	* `FloatingIslandRoot` (`Node3D`) con script asociado.
	* Varias capas `Sprite3D` para representar la isla y conos inferiores.
	* `Camera3D` con inclinación para vista tipo diorama.

### Script de comportamiento
* `scripts/floating_island.gd` implementa:
	* Parámetros exportados para velocidad y amplitud de flotación.
	* Cálculo senoidal en `_process(delta)`.
	* Entrada unificada en `_unhandled_input(event)` para touch/mouse.
	* Límites angulares de inclinación para preservar legibilidad visual.

## Requisitos

* Godot Engine `4.7` (o compatible con el formato del proyecto).

## Ejecución local

1. Abre Godot y selecciona **Import**.
2. Elige la carpeta de este repositorio.
3. Verifica que la escena principal sea `FloatingIsland.tscn`.
4. Ejecuta con **Play**.

## Controles del prototipo

* **Arrastrar con mouse (clic izquierdo)**: rota la isla.
* **Arrastrar con dedo (touch)**: rota la isla en dispositivos táctiles.
* La flotación vertical ocurre automáticamente.

## Configuración relevante

En `project.godot` se observa:
* `run/main_scene` apuntando a la escena de la isla.
* `renderer/rendering_method="mobile"` para un perfil de rendimiento orientado a móviles.
* `physics/3d/physics_engine="Jolt Physics"`.

## Hoja de ruta sugerida

1. Separar cada bioma en escenas independientes con transiciones.
2. Definir una arquitectura de minijuegos reutilizable (estado, puntuación, feedback).
3. Integrar un sistema de progreso sin castigo (florecimiento visual).
4. Añadir persistencia local de avance y personalización.
5. Incorporar pruebas de usabilidad para población infantil objetivo.

## Licencia

Consulta el archivo `LICENSE` para los términos de uso del proyecto.