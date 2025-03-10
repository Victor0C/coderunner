extends Node2D

@onready var PauseMenu = $PauseMenu
@onready var GmOverPanel = $GameOver
@onready var numero_fase = $numero_fase
@onready var fases = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_fases()
	renderizar_fase()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_fases():
	var dir = DirAccess.open("res://fases")
	if dir:
		var files = dir.get_files()
		for file in files:
			if file.ends_with(".tscn"):  # Filtra apenas cenas
				fases.append(file)
	else:
		print("Erro ao abrir a pasta 'fases'.")

func renderizar_fase():
	var random_file = fases[randi() % fases.size()]
	var fase_tscn = load("res://fases/" + random_file)
	var fase = fase_tscn.instantiate()
	fase.win.connect(win)
	fase.timeout.connect(timeout)
	get_tree().current_scene.add_child(fase)
	get_tree().current_scene.move_child(fase, 0)
	fase.visible = true

func timeout() -> void:
	GmOverPanel.visible = true
	PauseMenu.set_process(false)
	get_tree().paused = true

func win(emissor) -> void:
	emissor.queue_free()
	renderizar_fase()
	numero_fase.fase += 1
