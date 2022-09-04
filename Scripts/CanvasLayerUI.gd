extends CanvasLayer


var coins = 0

func _on_CoinCollected():
	coins += 1
	$CoinsTotal.text = String(coins)
	if coins == 5:
		$Youwin/AnimationPlayer/Label.visible = true
		$Youwin/AnimationPlayer.play("New Anim")
		pass
	

# Called when the node enters the scene tree for the first time.
func _ready():
	$Coin/Coin2D/AnimationPlayer.stop()
	$CoinsTotal.text = String(coins)
	$Youwin/AnimationPlayer.stop()
	$Youwin/AnimationPlayer/Label.visible = false
	
	pass # Replace with function body.



