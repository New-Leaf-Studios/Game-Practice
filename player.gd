extends Node2D

var direction: Vector2 = Vector2(1,1)
<<<<<<< HEAD
var speed: int = 7
=======
var speed: int = 7
>>>>>>> 7fef92140aa52d24b7288b4e967e13a41b14faad

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	
	position += direction * speed
