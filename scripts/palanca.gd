extends StaticBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var usada: bool = false
var jugador_cerca: bool = false
var jugador: CharacterBody2D = null
signal palanca_activada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if jugador_cerca and Input.is_action_just_pressed("mover"):
		abrir_puerta()
	
func abrir_puerta() -> void:
	if usada:
		return 
	usada = true
	if animated_sprite_2d.animation == "izquierda":
		animated_sprite_2d.play("derecha")
	else:
		animated_sprite_2d.play("izquierda")
	if jugador != null:
		jugador.ignorar_pulsacion()
	palanca_activada.emit()
	await get_tree().create_timer(5.0).timeout
	usada = false
	
func _on_jugador_entered(body: Node2D) -> void:
	if body.name == "jugador":
		jugador_cerca= true
		jugador= body
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "jugador":
		jugador_cerca= false
