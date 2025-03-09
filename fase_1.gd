extends Node2D

@onready var PauseMenuDisable = $PauseMenu
@onready var GmOverPanel = $GameOver
@onready var pergunta = $pergunta as Control
@onready var timer = $Timer as Node2D
@onready var alternativas = [
	$alternativa_a,
	$alternativa_b,
	$alternativa_c,
	$alternativa_d,
	$alternativa_e
	]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GmOverPanel.visible = false
	for i in range(alternativas.size()):
		alternativas[i].value = pergunta.alternativas[i]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hadle_collect(value: String):
	if value == pergunta.resposta_correta:
		print('Certo')
	else:
		timer.current_time -= 15
		


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


func _on_timer_timeout() -> void:
	print('Acabou a fase e o player perdeu')
	GmOverPanel.visible = true
	PauseMenuDisable.set_process(false)
	get_tree().paused = true
