extends StaticBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func boton_apretado(body: Node2D) -> void:
	if body.name== "jugador" or body.name=="caja":
		animated_sprite_2d.play("tocado")
		
func boton_no_apretado(body: Node2D) -> void:
	if body.name== "jugador" or body.name=="caja":
		animated_sprite_2d.play("sin_tocar")
