class_name GhostPlayer
extends CharacterBody2D

signal possess_started
signal possess_finished

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var movement: MovementComponent = $MovementComponent
