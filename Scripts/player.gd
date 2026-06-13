extends CharacterBody2D


var direction: Vector2 = Vector2(1,1)
var speed: int = 180
var sprintSpeed: float = 220

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	animation()
	move_and_slide()	

func animation():
	if direction:
		$TestingTimothy.flip_h = direction.x > 0
		if direction.x != 0:
			$TestingTimothy.play("left")
		else:
			$TestingTimothy.animation = "up" if direction.y < 0 else "down"
	else:
		$TestingTimothy.frame = 0
