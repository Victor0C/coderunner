extends Node2D

@onready var PauseMenu = $PauseMenu
@onready var GmOverPanel = $GameOver

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
