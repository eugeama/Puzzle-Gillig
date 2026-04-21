extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var agarre_caja: Marker2D = $agarre_caja
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var agarre: bool = false
var caja: RigidBody2D
var objetivo: RigidBody2D
var veces_presionado = 0

func _physics_process(delta: float) -> void:
	sumar_presion()
	agarrar_caja()
	soltar_caja()
	var direccion := Input.get_vector("izquierda", "derecha", "arriba", "abajo")
	
	if direccion:
		velocity = direccion * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if velocity.x or velocity.y > 1 or velocity.x or velocity.y < -1:
		animated_sprite_2d.play("caminando")
	else:
		animated_sprite_2d.play("quieta")
		
	if direccion.x == 1.0:
		animated_sprite_2d.flip_h= false
	elif direccion.x == -1.0:
		animated_sprite_2d.flip_h= true
		
	move_and_slide()

func sumar_presion() -> void:
	if Input.is_action_just_pressed("mover"):
		veces_presionado+=1

func agarrar_caja() -> void:
	if agarre and caja != null and veces_presionado==1:
		caja.collision_layer = 0
		caja.collision_mask = 0
		caja.freeze = true 
		caja.reparent(agarre_caja)
		caja.position= Vector2.ZERO
			
func soltar_caja()-> void:
	if caja and veces_presionado==2:
		caja.collision_layer = 1 
		caja.collision_mask = 1
		caja.freeze = false
		caja.reparent(get_parent())
		caja.global_position= position + Vector2.RIGHT * 10
		caja= null
		veces_presionado=0

func _on_rango_de_agarre_body_entered(body: Node2D) -> void:
	if body is RigidBody2D and veces_presionado == 0:
		agarre= true
		caja= body


func _on_rango_de_agarre_body_exited(body: Node2D) -> void:
	if body is RigidBody2D:
		agarre= false
