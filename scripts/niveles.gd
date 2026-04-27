extends Control

@onready var botones = [
	$GridContainer/TextureButton,
	$GridContainer/TextureButton2,
	$GridContainer/TextureButton3,
	$GridContainer/TextureButton4,
	$GridContainer/TextureButton5,
]

func _ready() -> void:
	for i in botones.size():
		var numero_nivel = i + 1
		var desbloqueado = numero_nivel <= AvanzarNivel.nivel_desbloqueado
		botones[i].disabled = not desbloqueado
		

func _process(delta: float) -> void:
	pass
	
func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://niveles/Nivel_1.tscn")


func _on_texture_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://niveles/Nivel_2.tscn")


func _on_texture_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://niveles/Nivel_3.tscn")


func _on_texture_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://niveles/Nivel_4.tscn")


func _on_texture_button_5_pressed() -> void:
	get_tree().change_scene_to_file("res://niveles/Nivel_5.tscn")
