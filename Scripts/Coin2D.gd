extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Coin2D_body_entered(body):
	if body.get_name() == "Player":
		queue_free()
		body.add_coin()
		print("moneda pillada!!!")
	
	pass # Replace with function body.
