extends Control
@onready var PauseMenu = $Panel
var isPaused = false

func _ready():
	PauseMenu.visible = false
	get_tree().paused = false
func _process(delta):
	if Input.is_action_just_pressed("Esc") and isPaused == false:
		PauseMenu.visible = true
		var isPaused = true
		get_tree().paused = true
		print("Pausado")
func _on_resume_pressed():
	PauseMenu.visible = false
	var isPaused = false
	get_tree().paused = false
	print("Jogo Retomado")


func _on_restart_pressed():
	get_tree().reload_current_scene()
	print("Reiniciou a fase")


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://fases/StartMenu.tscn")
	print("Voltou para a tela de título")
