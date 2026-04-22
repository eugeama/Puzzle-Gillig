extends StaticBody2D

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

signal objeto_recolectado()

func desaparecer(body: Node2D) -> void:
	if body.name == "jugador":
		$Sprite2D.visible = false
		$CollisionShape2D.disabled = true
		objeto_recolectado.emit()
