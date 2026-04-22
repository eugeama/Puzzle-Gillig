extends StaticBody2D
var recolectado: bool = false

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

signal objeto_recolectado()

func desaparecer(body: Node2D) -> void:
	if body.is_in_group("jugador") and not recolectado:
		recolectado = true
		$Sprite2D.visible = false
		$CollisionShape2D.disabled = true
		$Area2D.monitoring = false
		objeto_recolectado.emit()
