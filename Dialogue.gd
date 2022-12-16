extends Control

var dialogue = []
var dialogue_pos = 0
var dialogue_resp_1 = []
var dialogue_resp_2 = []
var dialogue_resp_pos_1 = 0
var dialogue_resp_pos_2 = 0


func _ready():
	hide()

func _physics_process(_delta):
	if dialogue.size() and dialogue_pos < dialogue.size(): 
		var d = dialogue[dialogue_pos]
		if $Text.bbcode_text != d:
			$Text.bbcode_text = d
	if dialogue_resp_1.size() and dialogue_resp_pos_1 < dialogue_resp_1.size():
		var r1 = dialogue_resp_1[dialogue_resp_pos_1]
		if $Option1.text !=  r1:
			$Option1.text = r1
	else:
		hide_dialogue()
	if dialogue_resp_2.size() and dialogue_resp_pos_2 < dialogue_resp_2.size():
		var r2 = dialogue_resp_2[dialogue_resp_pos_2]
		if $Option2.text !=  r2:
			$Option2.text = r2
	else:
		hide_dialogue()

		
func start_dialogue(d, r1, r2):
	dialogue = d.duplicate()
	dialogue_pos = 0
	dialogue_resp_1 = r1.duplicate()
	dialogue_resp_2 = r2.duplicate()
	dialogue_resp_pos_1 = 0
	dialogue_resp_pos_2 = 0
	show()


func hide_dialogue():
	dialogue = []
	dialogue_pos = 0
	dialogue_resp_1 = []
	dialogue_resp_2 = []
	dialogue_resp_pos_1 = 0
	dialogue_resp_pos_2 = 0
	hide()


func _on_Option1_pressed():
	dialogue_pos += 1
	dialogue_resp_pos_1 += 1
	dialogue_resp_pos_2 += 1
	if $Text.bbcode_text == "thank you! yes you two can go on in":
		get_tree().change_scene("res://Menus/End.tscn")


func _on_Option2_pressed():
	dialogue_pos += 2
	dialogue_resp_pos_1 += 1
	dialogue_resp_pos_2 += 1
	if $Text.bbcode_text == "thank you! yes you two can go on in":
		get_tree().change_scene("res://Menus/End.tscn")
