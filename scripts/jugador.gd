extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var agarre_caja: Marker2D = $agarre_caja
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var agarre: bool = false
var caja: RigidBody2D
var objetivo: RigidBody2D
var veces_presionado: int = 0
var sosteniendo: bool = false
var _ignorar_proxima: bool = false

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
		agarre_caja.position.x = abs(agarre_caja.position.x)
	elif direccion.x == -1.0:
		animated_sprite_2d.flip_h= true
		agarre_caja.position.x = -abs(agarre_caja.position.x)
		
	move_and_slide()
	
func ignorar_pulsacion() -> void:
	_ignorar_proxima = true

func sumar_presion() -> void:
	if Input.is_action_just_pressed("mover"):
		if _ignorar_proxima:
			_ignorar_proxima = false
			return
		veces_presionado+=1
		
func agarrar_caja() -> void:
	if agarre and caja != null and veces_presionado==1 and not sosteniendo:
		sosteniendo = true
		var caja_a_agarrar = caja
		caja_a_agarrar.collision_layer = 0
		caja_a_agarrar.collision_mask = 0
		caja_a_agarrar.freeze = true 
		caja_a_agarrar.reparent(agarre_caja)
		caja_a_agarrar.position= Vector2.ZERO
		caja = caja_a_agarrar
			
func soltar_caja()-> void:
	if sosteniendo and veces_presionado==2:
		sosteniendo = false
		caja.collision_layer = 1 
		caja.collision_mask = 1
		caja.freeze = false
		caja.reparent(get_parent())
		if animated_sprite_2d.flip_h:
			caja.global_position= global_position + Vector2.LEFT * 10
		else:
			caja.global_position= global_position + Vector2.RIGHT * 10
		caja= null
		agarre= false
		await get_tree().physics_frame
		veces_presionado=0
		
func _on_rango_de_agarre_body_entered(body: Node2D) -> void:
	if body is RigidBody2D and not sosteniendo:
		agarre= true
		caja= body
		
		
func _on_rango_de_agarre_body_exited(body: Node2D) -> void:
	if body is RigidBody2D and not sosteniendo:
		agarre= false
		if veces_presionado == 0:
			caja= null
