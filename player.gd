extends Node2D

var direction: Vector2 = Vector2(1,1)
<<<<<<< HEAD
<<<<<<< HEAD
var speed: int = 7
=======
var speed: int = 5
>>>>>>> 4b87eb29d0a7a9c66958697f632978d282a8bff1
=======

var speed: int = 7
>>>>>>> 20a2322f8e4d5ce72756ae1747fb8c9f359c0bde

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	
	position += direction * speed
