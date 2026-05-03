extends Control

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(AvanzarNivel.escena_actual)


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://pantallas/pantalla_inicio.tscn")
