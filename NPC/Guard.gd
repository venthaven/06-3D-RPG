extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")
onready var player = get_node("/root/Game/Player")

var dialogue = [
	"da boss told me you aint gettin in here!",
	"no can do ma'am",
	"no can do ma'am",
]

var dialogue_blast = [
	"da boss told me you aint gettin in here!",
	"no can do ma'am",
	"thank you! yes you two can go on in",
]

var dialogue_resp_1 = [
	"aww please?",
	"just doing your job i understand",
]

var dialogue_resp_2 = [
	"i'll be your friend if you do",
	"fine",
]

var dialogue_resp_2_blast = [
	"i'll give you this blaster if you do",
	"thanks",
]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.hide_dialogue()



func _on_Area2_body_entered(_body):
	if player.blaster == true:
		Dialogue.start_dialogue(dialogue_blast, dialogue_resp_1, dialogue_resp_2_blast)
	else:
		Dialogue.start_dialogue(dialogue, dialogue_resp_1, dialogue_resp_2)


func _on_Area2_body_exited(_body):
	Dialogue.hide_dialogue()
