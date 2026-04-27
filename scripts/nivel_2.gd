extends Node2D
var objetos_recolectados: int = 0
var total_objetos: int = 0
var jugador_en_area_npc: bool = false

func _ready() -> void:
	total_objetos = get_tree().get_nodes_in_group("objetos").size()
	$objetos_conseguidos.cambiar_puntos(objetos_recolectados, total_objetos)

func _process(delta: float) -> void:
	pass
	
func objeto_conseguido() -> void:
	objetos_recolectados += 1
	$objetos_conseguidos.cambiar_puntos(objetos_recolectados, total_objetos)
	
func terminar_nivel() -> void:
	if objetos_recolectados == total_objetos and jugador_en_area_npc:
		AvanzarNivel.ganar_nivel(2)
		get_tree().change_scene_to_file("res://pantallas/ganaste.tscn")
	
func _on_npc_jugador_cerca_npc() -> void:
	jugador_en_area_npc = true
	terminar_nivel()
