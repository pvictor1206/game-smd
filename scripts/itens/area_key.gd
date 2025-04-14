extends Area3D

const ROTATION_SPEED := 30.0

var start_pos := position.y
var end_pos := position.y + 0.3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		var key_tween := create_tween().set_loops().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
		key_tween.tween_property(self, "position:y", end_pos, 1.0).from(start_pos)
		key_tween.tween_property(self, "position:y", start_pos, 1.0).from(end_pos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(deg_to_rad(ROTATION_SPEED * delta))


func _on_body_entered(body: Node3D) -> void:
	if body.name == "player":
		if body.has_method("collect_keys"):
			body.collect_keys()
		queue_free()
