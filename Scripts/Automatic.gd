
extends StaticBody2D
@export var speed = 2

var targetPos
var targetDirection
var pos1
var pos2

func _ready():
	pos1 = get_node("/root/Level/AutomaticDoor/Pos1")
	pos2 = get_node("/root/Level/AutomaticDoor/Pos2")
	
	targetPos = pos1.position

func _physics_process(delta):
	if (position.distance_to(targetPos) > 3):
		targetDirection = (targetPos - position).normalized()
		position += speed * targetDirection

func _on_character_entered(body: Node2D):
	if body is Player:
		targetPos = pos2.position
		push_warning("Hit")


func _on_character_exited(body: Node2D):
	if body is Player:
		targetPos = pos1.position
