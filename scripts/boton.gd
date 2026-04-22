extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var cuerpos_encima: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

signal boton_activado
signal boton_desactivado

func boton_apretado(body: Node2D) -> void:
	if body.name== "jugador" or body is RigidBody2D:
		cuerpos_encima += 1
		animated_sprite_2d.play("tocado")
		boton_activado.emit()
		
func boton_no_apretado(body: Node2D) -> void:
	if body.name== "jugador" or body is RigidBody2D:
		cuerpos_encima -= 1
		if cuerpos_encima <= 0:
			cuerpos_encima = 0
			animated_sprite_2d.play("sin_tocar")
			boton_desactivado.emit()
