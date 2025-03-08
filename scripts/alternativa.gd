extends Area2D


@onready var anim := $anim as AnimatedSprite2D
@export var value = 'Passa o valor da letra MACACO'
signal collected(value: String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	emit_signal("collected", value)
	$anim.play('collected')


func _on_anim_animation_finished() -> void:
	queue_free()
