class_name GhostJumpState
extends State

@onready var ghost: GhostPlayer = owner as GhostPlayer


func enter() -> void:
	ghost.movement.jump()


func physics_update(delta: float) -> void:
	ghost.movement.apply_gravity(delta)

	var direction := Input.get_axis(PlayerActions.MOVE_LEFT, PlayerActions.MOVE_RIGHT)
	ghost.movement.move(direction)
	ghost.movement.run()
	ghost.sprite.play(GhostAnimations.IDLE_WEST if ghost.movement.facing < 0 else GhostAnimations.IDLE_EAST)

	if ghost.is_on_floor():
		transitioned.emit("move" if direction != 0.0 else "idle")


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed(PlayerActions.POSSESS):
		transitioned.emit("possess")
