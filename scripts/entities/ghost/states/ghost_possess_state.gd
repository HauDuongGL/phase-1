class_name GhostPossessState
extends State

@onready var ghost: GhostPlayer = owner as GhostPlayer


func enter() -> void:
	ghost.velocity = Vector2.ZERO
	ghost.sprite.play(GhostAnimations.POSSESS)
	ghost.sprite.animation_finished.connect(_on_animation_finished)
	ghost.possess_started.emit()


func exit() -> void:
	ghost.sprite.animation_finished.disconnect(_on_animation_finished)
	ghost.possess_finished.emit()


func physics_update(_delta: float) -> void:
	ghost.velocity = Vector2.ZERO
	ghost.movement.run()


func _on_animation_finished() -> void:
	transitioned.emit("idle")
