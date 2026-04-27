extends CharacterBody2D

@onready var personaje: Sprite2D = $Sprite2D
@onready var camino_a_seguir: PathFollow2D = $Path2D/PathFollow2D
@onready var area: Area2D = $Area2D

@export var rapidez: float = 200.0
var ultima_posicion: Vector2

signal perder

func _ready() -> void:
	position= camino_a_seguir.global_position
	ultima_posicion = position

func _physics_process(delta: float) -> void:
	camino_a_seguir.progress += rapidez*delta
	personaje.global_position = camino_a_seguir.global_position
	var posicion = camino_a_seguir.global_position
	personaje.global_position = posicion
	area.global_position = posicion


func _on_jugador_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		perder.emit()
