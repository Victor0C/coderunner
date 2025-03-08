extends Node2D

@onready var pergunta = $pergunta as Control
@onready var alternativas = [
	$alternativa_a,
	$alternativa_b,
	$alternativa_c,
	$alternativa_d,
	$alternativa_e
	]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(alternativas.size()):
		alternativas[i].value = pergunta.alternativas[i]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hadle_collect(value: String):
	print('Resposta Certa: ' +  pergunta.resposta_correta)
	print('Na moeda:' + value)
	if value == pergunta.resposta_correta:
		print('Certo')
	else:
		print('Errado')
		


func _on_alternativa_a_collected(value: String) -> void:
	hadle_collect(value)


func _on_alternativa_b_collected(value: String) -> void:
	hadle_collect(value)


func _on_alternativa_c_collected(value: String) -> void:
	hadle_collect(value)


func _on_alternativa_d_collected(value: String) -> void:
	hadle_collect(value)


func _on_alternativa_e_collected(value: String) -> void:
	hadle_collect(value)
