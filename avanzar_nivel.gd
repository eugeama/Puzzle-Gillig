extends Node
var nivel_desbloqueado: int = 1
var escena_actual: String = ""

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
func ganar_nivel(numero: int) -> void:
	if numero >= nivel_desbloqueado:
		nivel_desbloqueado = numero + 1
