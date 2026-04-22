extends Label
@onready var cant_objetos = $Objetos

var cantidad: int = 0
var total: int = 0

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass
	
func cambiar_puntos(cant: int, tot: int) -> void:
	cantidad = cant
	total = tot
	text = str(cantidad) + "/" + str(total) + " Objetos"
