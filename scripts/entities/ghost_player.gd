extends CharacterBody2D

const SPEED := 120.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var is_possessing := false


func _physics_process(_delta: float) -> void:
	if is_possessing:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED
	velocity.y = 0.0
	move_and_slide()

	if direction < 0.0:
		sprite.play("idle_west")
	elif direction > 0.0:
		sprite.play("idle_east")
	else:
		sprite.play("idle_south")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("possess"):
		_play_possess()


func _play_possess() -> void:
	is_possessing = true
	sprite.play("possess")


func _on_sprite_animation_finished() -> void:
	if sprite.animation == "possess":
		is_possessing = false
