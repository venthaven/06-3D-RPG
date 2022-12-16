extends Spatial


func _ready():
	pass


func _on_Area_body_entered(body):
		if body.has_method("blaster_get"):
			body.blaster_get()
			queue_free()
