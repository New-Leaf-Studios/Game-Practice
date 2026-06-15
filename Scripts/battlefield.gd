extends TileMapLayer

var player_scene: PackedScene = preload("res://Scenes/combat_player.tscn")

var player = player_scene.instantiate() as Node2D

func _ready() -> void:
	$Fighters.add_child(player)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("select"):
		
		var mouse_position: Vector2 = get_local_mouse_position()
		var grid_position: Vector2i = local_to_map(mouse_position)
		
		
		player.position = map_to_local(grid_position)
		
		print ("you clicked pixel: ", mouse_position, " which is tile: ", grid_position)
