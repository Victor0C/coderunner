extends Node2D

@onready var pergunta = $pergunta as Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(pergunta.alternativas)
	print(pergunta.resposta_correta)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
