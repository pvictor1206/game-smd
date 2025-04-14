extends HBoxContainer
class_name KeyContainer

@onready var key_label = $key_label

func update_key(amount: int):
	key_label.text = ' ' + str(amount) + '/3'

# implementação do "Observer"
func on_key_collected(new_total: int) -> void:
	update_key(new_total)
