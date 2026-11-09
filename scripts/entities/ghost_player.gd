extends CharacterBody2D

const SPEED := 120.0
const JUMP_VELOCITY := -300.0
const GRAVITY := 900.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var is_possessing := false
var facing := 1


func _physics_process(delta: float) -> void:
	if is_possessing:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	if not is_on_floor():
		velocity.y += GRAVITY * delta
	elif Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED
	move_and_slide()

	if direction < 0.0:
		facing = -1
	elif direction > 0.0:
		facing = 1

	if not is_on_floor():
		sprite.play("idle_west" if facing < 0 else "idle_east")
	elif direction < 0.0:
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
