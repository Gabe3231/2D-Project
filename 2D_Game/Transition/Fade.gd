extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect
@onready var timer: Timer = $Timer

func _ready() -> void:
	color_rect.modulate.a = 0.0

func _on_timeout() -> void:
	print("Switching scene")
	get_tree().change_scene_to_file("res://Story/story_scene_2.tscn")

# troubleshooting
func start_transition():
	print("Transition")

	# calling audio to lower it as scene end
	var music = get_parent().get_node("AudioStreamPlayer2D")

	var tween = create_tween()
	tween.set_parallel(true)
	# setting volume -40 is practicaly silent
	tween.tween_property(color_rect, "modulate:a", 1.0, 2.0)
	tween.tween_property(music, "volume_db", -40.0, 2.0)

	timer.start(2.0)
