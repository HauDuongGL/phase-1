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
	elif Input.is_action_just_pressed(PlayerActions.JUMP):
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis(PlayerActions.MOVE_LEFT, PlayerActions.MOVE_RIGHT)
	velocity.x = direction * SPEED
	move_and_slide()

	if direction < 0.0:
		facing = -1
	elif direction > 0.0:
		facing = 1

	if not is_on_floor():
		sprite.play(GhostAnimations.IDLE_WEST if facing < 0 else GhostAnimations.IDLE_EAST)
	elif direction < 0.0:
		sprite.play(GhostAnimations.IDLE_WEST)
	elif direction > 0.0:
		sprite.play(GhostAnimations.IDLE_EAST)
	else:
		sprite.play(GhostAnimations.IDLE_SOUTH)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(PlayerActions.POSSESS):
		_play_possess()


func _play_possess() -> void:
	is_possessing = true
	sprite.play(GhostAnimations.POSSESS)


func _on_sprite_animation_finished() -> void:
	if sprite.animation == GhostAnimations.POSSESS:
		is_possessing = false
