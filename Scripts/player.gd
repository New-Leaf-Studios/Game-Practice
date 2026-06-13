extends Node2D


var direction: Vector2 = Vector2(1,1)
var speed: int = 3
var sprintSpeed: float = 5.5

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	
	if Input.is_action_pressed("dash"):
		position += direction * sprintSpeed
	else:
		position += direction * speed
	
	if abs(direction.y) > abs(direction.x):
		$player.play("down")
	else:
		$player.play("side")
	
	if direction.x >= 0.1:
		$player.flip_h = true
	elif direction.x <= -0.1:
		$player.flip_h = false
	
