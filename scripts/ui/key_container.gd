extends HBoxContainer

@onready var key_label = $key_label

func update_key(amount: int):
	key_label.text = '     ' + str(amount) + '/3'
