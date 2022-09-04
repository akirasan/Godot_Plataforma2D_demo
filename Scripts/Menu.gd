extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Iniciar_pressed():
	get_tree().change_scene("res://Scenes/Mundo.tscn")
	pass # Replace with function body.


func _on_Salir_pressed():
	get_tree().quit()
	pass # Replace with function body.
