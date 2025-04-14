extends HBoxContainer
class_name KeyContainer

@onready var key_label = $key_label

@export var menu : PackedScene

func update_key(amount: int):
	key_label.text = '     ' + str(amount) + '/3'

# implementação do "Observer"
func on_key_collected(new_total: int) -> void:
	update_key(new_total)


func _on_btn_exit_pressed() -> void:
	$"../alert_fail".visible = false


func _on_btn_conf_pressed() -> void:
	#Não está reconhecendo a cena de menu
	#get_tree().change_scene_to_packed(menu)
	get_tree().quit()
