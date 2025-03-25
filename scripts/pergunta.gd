extends Control

@onready var rich_text = $ColorRect/HBoxContainer/VBoxContainer/RichTextLabel
@onready var pergunta_anterior

@export var resposta_correta: String
@export var alternativas: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var perguntas = carregar_perguntas("res://perguntas.json")
	if perguntas:
		exibir_pergunta_aleatoria(perguntas)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func carregar_perguntas(caminho: String) -> Array:
	var file = FileAccess.open(caminho, FileAccess.READ)
	if file:
		var conteudo = file.get_as_text()
		var json = JSON.new()
		var parse_result = json.parse(conteudo)
		if parse_result == OK:
			return json.data
	return []
	
func exibir_pergunta_aleatoria(perguntas: Array):
	rich_text.clear()
	var pergunta
	while true:
		pergunta = perguntas.pick_random()
		if pergunta != pergunta_anterior:
			pergunta_anterior = pergunta
			break
	resposta_correta = pergunta["alternativa_correta"]
	
	print(resposta_correta)
	
	alternativas = pergunta["alternativas"]
	rich_text.append_text(pergunta["pergunta"] + "\n")
	for alternativa in pergunta["alternativas"]:
		rich_text.append_text("%s\n" % alternativa)
