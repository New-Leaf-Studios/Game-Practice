extends Node2D


var direction: Vector2 = Vector2(1,1)
var speed: int = 2

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	
	position += direction * speed
	if direction.x >= 0.1:
		$player.flip_h = true
	elif direction.x <= -0.1:
		$player.flip_h = false
	
	print(direction)
#up = 0,-1
#down = 0,1
