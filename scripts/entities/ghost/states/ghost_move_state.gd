class_name GhostMoveState
extends State

@onready var ghost: GhostPlayer = owner as GhostPlayer


func physics_update(delta: float) -> void:
	ghost.movement.apply_gravity(delta)

	if not ghost.is_on_floor():
		transitioned.emit("jump")
		return

	var direction := Input.get_axis(PlayerActions.MOVE_LEFT, PlayerActions.MOVE_RIGHT)
	if direction == 0.0:
		transitioned.emit("idle")
		return

	ghost.movement.move(direction)
	ghost.movement.run()
	ghost.sprite.play(GhostAnimations.IDLE_WEST if direction < 0.0 else GhostAnimations.IDLE_EAST)


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed(PlayerActions.JUMP) and ghost.is_on_floor():
		transitioned.emit("jump")
	elif event.is_action_pressed(PlayerActions.POSSESS):
		transitioned.emit("possess")
