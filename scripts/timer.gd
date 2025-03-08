extends Node2D


@export var current_time: int = 30
@onready var label := $Label as Label
@onready var timer := $timer1 as Timer

signal timeout
var timeout_notified = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_time <= 0:
		current_time = 0
		if !timeout_notified:
			emit_signal("timeout")
			timeout_notified = true
		
	if current_time <= 9:
		label.text = '0' + str(current_time)
	else:
		label.text = str(current_time)
	

func _on_timer_1_timeout() -> void:
	current_time -= 1
