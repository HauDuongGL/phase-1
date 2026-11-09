class_name GhostIdleState
extends State

@onready var ghost: GhostPlayer = owner as GhostPlayer


func enter() -> void:
	ghost.movement.stop_horizontal()
	ghost.sprite.play(GhostAnimations.IDLE_SOUTH)


func physics_update(delta: float) -> void:
	ghost.movement.apply_gravity(delta)
	ghost.movement.run()

	if not ghost.is_on_floor():
		transitioned.emit("jump")
		return

	var direction := Input.get_axis(PlayerActions.MOVE_LEFT, PlayerActions.MOVE_RIGHT)
	if direction != 0.0:
		transitioned.emit("move")


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed(PlayerActions.JUMP) and ghost.is_on_floor():
		transitioned.emit("jump")
	elif event.is_action_pressed(PlayerActions.POSSESS):
		transitioned.emit("possess")
