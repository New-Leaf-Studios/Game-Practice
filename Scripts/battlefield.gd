extends TileMapLayer

var entity_scene: PackedScene = preload("res://Scenes/combat_player.tscn")
var player = entity_scene.instantiate() as Node2D

var current_position: Vector2i

enum TurnState {PLAYER_TURN, ENEMY_TURN, PROCESSING}
var current_turn = TurnState.PLAYER_TURN

func _ready() -> void:
	$Fighters.add_child(player)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("select") && current_turn == TurnState.PLAYER_TURN:
		
		var mouse_position: Vector2 = get_local_mouse_position()
		var grid_position: Vector2i = local_to_map(mouse_position)
		
		if abs(current_position.x - grid_position.x) + abs(current_position.y - grid_position.y) <= 5:
			player.position = map_to_local(grid_position)
			current_position = grid_position
			current_turn = TurnState.ENEMY_TURN
		else:
			print("too far!")
			
func _process(delta: float) -> void:
	match current_turn:
		TurnState.PLAYER_TURN:
			pass
		TurnState.ENEMY_TURN:
			print("pretend enemy moved here")
			current_turn = TurnState.PROCESSING
			print("processing")
			await get_tree().create_timer(1.5).timeout
			print("ok its your turn now.")
			current_turn = TurnState.PLAYER_TURN
		TurnState.PROCESSING:
			pass
