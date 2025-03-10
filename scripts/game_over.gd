extends Control

func _on_restart_game_over_pressed():
	visible = false
	get_tree().reload_current_scene()


func _on_quit_game_over_pressed():
	get_tree().change_scene_to_file("res://fases/StartMenu.tscn")
