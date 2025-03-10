extends Node2D

@export var fase: int = 1
@onready var label = $Label as Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = 'FASE: ' + str(fase)
