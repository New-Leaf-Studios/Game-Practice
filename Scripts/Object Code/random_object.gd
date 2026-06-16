extends MultiMeshInstance2D
#yt video that helped https://www.youtube.com/watch?v=o8I1yTLY6UA

var tree_id: int = 0
#each tree has its individual id assigned to them
@export var spawnMultiMesh: bool = true
#if set to true, trees will spawn


func _ready() -> void:
	if spawnMultiMesh:
		for x in multimesh.instance_count:
			multimesh.set_instance_transform_2d(tree_id,
			Transform2D(
				0, Vector2(
					randi_range(0, 1152),
					randi_range(0, 648)
					)))
			tree_id += 1
