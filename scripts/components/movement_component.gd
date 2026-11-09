class_name MovementComponent
extends Node

@export var stats: GhostStats
@export var body_path: NodePath

@onready var body: CharacterBody2D = get_node(body_path)

var facing := 1


func apply_gravity(delta: float) -> void:
	if not body.is_on_floor():
		body.velocity.y += stats.gravity * delta


func move(direction: float) -> void:
	body.velocity.x = direction * stats.speed
	if direction < 0.0:
		facing = -1
	elif direction > 0.0:
		facing = 1


func stop_horizontal() -> void:
	body.velocity.x = 0.0


func jump() -> void:
	body.velocity.y = stats.jump_velocity


func run() -> void:
	body.move_and_slide()
