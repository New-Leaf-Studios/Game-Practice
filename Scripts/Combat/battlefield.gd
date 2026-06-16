extends Node2D

var entity_scene: PackedScene = preload("res://Scenes/Characters/combat_player.tscn")
var player = entity_scene.instantiate() as Node2D
var enemy = entity_scene.instantiate() as Node2D

@onready var grid = $TileMapLayer

var current_position: Vector2i
var enemy_position: Vector2i = Vector2i(12, 0)

enum TurnState {PLAYER_TURN, ENEMY_TURN, PROCESSING}
var current_turn = TurnState.PLAYER_TURN

var testing_enemy_start: Vector2i = Vector2i(12, 0)

func _ready() -> void:
	$Fighters.add_child(player)
	$Fighters.add_child(enemy)
	enemy.position = grid.map_to_local(testing_enemy_start)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("select") && current_turn == TurnState.PLAYER_TURN:
		
		var mouse_position: Vector2 = get_local_mouse_position()
		var grid_position: Vector2i = grid.local_to_map(mouse_position)
		
		if abs(current_position.x - grid_position.x) + abs(current_position.y - grid_position.y) <= 5:
			player.position = grid.map_to_local(grid_position)
			current_position = grid_position
			current_turn = TurnState.ENEMY_TURN
		else:
			print("too far!")
			
func _process(delta: float) -> void:
	match current_turn:
		TurnState.PLAYER_TURN:
			pass
		TurnState.ENEMY_TURN:
			var chase_vector = current_position - enemy_position
			var step = Vector2i.ZERO
			
			if abs(chase_vector.x) >= abs(chase_vector.y):
				step.x = sign(chase_vector.x)
			else:
				step.y = sign(chase_vector.y)
			enemy_position += step  # Move their grid tracker
			enemy.position = grid.map_to_local(enemy_position)  # Teleport the actual sprite pixels!
			current_turn = TurnState.PROCESSING
			print("processing")
			await get_tree().create_timer(1.5).timeout
			print("ok its your turn now.")
			current_turn = TurnState.PLAYER_TURN
		TurnState.PROCESSING:
			pass
