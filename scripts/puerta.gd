extends StaticBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collisionshape2d: CollisionShape2D = $CollisionShape2D 

func _ready() -> void:
	pass
func _process(delta: float) -> void:
	pass
	
func abrir() -> void:
	animated_sprite_2d.play("abierta")
	collisionshape2d.disabled = true

func cerrar() -> void:
	animated_sprite_2d.play("cerrada")
	collisionshape2d.disabled = false
	
func control_palanca() -> void:
		abrir()
		await get_tree().create_timer(5.0).timeout
		cerrar()
