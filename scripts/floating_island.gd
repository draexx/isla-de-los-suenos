extends Node3D

# Variables configurables desde el Inspector
@export var float_speed: float = 2.0      # Velocidad del bamboleo
@export var float_amplitude: float = 0.15  # Altura del bamboleo en metros
@export var tilt_sensitivity: float = 0.005

var time: float = 0.0
var initial_y: float = 0.0

# Variables para control de rotación por arrastre
var is_dragging: bool = false
var target_rotation: Vector2 = Vector2.ZERO

func _ready() -> void:
	# Guardamos la posición inicial en Y
	initial_y = position.y

func _unhandled_input(event: InputEvent) -> void:
	# Soporte unificado para Touch y Mouse
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		is_dragging = event.pressed
	elif event is InputEventScreenTouch:
		is_dragging = event.pressed
		
	if is_dragging and (event is InputEventMouseMotion or event is InputEventScreenDrag):
		# Acumula rotación objetivo con límites suaves
		target_rotation.y += event.relative.x * tilt_sensitivity
		target_rotation.x += event.relative.y * tilt_sensitivity
		
		# Limita el ángulo para no deformar la vista del diorama
		target_rotation.x = clamp(target_rotation.x, deg_to_rad(-15), deg_to_rad(15))
		target_rotation.y = clamp(target_rotation.y, deg_to_rad(-25), deg_to_rad(25))
		
func _process(delta: float) -> void:
	# 1. Movimiento senoidal de flotación
	time += delta * float_speed
	position.y = initial_y + (sin(time) * float_amplitude)
	
	# 2. Suavizado de la rotación estilo diorama (Lerp)
	rotation.x = lerp_angle(rotation.x, target_rotation.x, delta * 5.0)
	rotation.y = lerp_angle(rotation.y, target_rotation.y, delta * 5.0)
	
