extends Node3D

# Variables configurables desde el Inspector
@export var float_speed: float = 2.0      # Velocidad del bamboleo
@export var float_amplitude: float = 0.15  # Altura del bamboleo en metros

var time: float = 0.0
var initial_y: float = 0.0

func _ready() -> void:
	# Guardamos la posición inicial en Y
	initial_y = position.y

func _process(delta: float) -> void:
	time += delta * float_speed
	# Aplicamos movimiento senoidal suave sobre el eje Y
	position.y = initial_y + (sin(time) * float_amplitude)
