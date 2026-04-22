extends StaticBody2D

signal jugador_cerca_npc

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		jugador_cerca_npc.emit()
