extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"welcome to the game! hit the button to respond to me!",
	"great job! now, will you please tell the guard over there to let us in?",
	"come on show a little enthusiasm! can you at least tell the guard over there to let us in?",
]

var dialogue_resp_1 = [
	"hi!",
	"no problem!",
]
var dialogue_resp_2 = [
	"hey",
	"fine",

]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.hide_dialogue()



func _on_Area_body_entered(_body):
	Dialogue.start_dialogue(dialogue, dialogue_resp_1, dialogue_resp_2)


func _on_Area_body_exited(_body):
	Dialogue.hide_dialogue()
