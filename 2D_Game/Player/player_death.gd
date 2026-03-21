extends AnimatedSprite2D

signal finished

func _ready() -> void:
	frame = 0
	play("default")
	print("Player death animation started")


func _on_finished() -> void:
	print("Player death animation finished")
	finished.emit()
	queue_free()
