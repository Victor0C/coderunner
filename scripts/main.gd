extends Node2D

@onready var PauseMenu = $PauseMenu
@onready var GmOverPanel = $GameOver
@onready var numero_fase = $numero_fase

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_fase_1_timeout() -> void:
	GmOverPanel.visible = true
	PauseMenu.set_process(false)
	get_tree().paused = true


func _on_fase_1_win(emissor) -> void:
	emissor.queue_free()
	var fase2_scene = load("res://fases/fase2.tscn")
	var fase2 = fase2_scene.instantiate()
	fase2.win.connect(_on_fase_1_win)
	fase2.timeout.connect(_on_fase_1_timeout)
	
	if !fase2:
		print('não pegou a fase')
	else:
		get_tree().current_scene.add_child(fase2)
		get_tree().current_scene.move_child(fase2, 0)
		fase2.visible = true
		numero_fase.fase += 1
	
