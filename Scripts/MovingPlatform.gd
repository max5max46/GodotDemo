extends StaticBody2D

@export var speed = 2
@export var waitTime = 1

var targetPos
var targetDirection
var pos1
var pos2
var waitTimer = 0

func _ready():
	pos1 = get_node("/root/Level/MovingPlatform/Pos1")
	pos2 = get_node("/root/Level/MovingPlatform/Pos2")
	
	targetPos = pos1.position


func _physics_process(delta):
	
	if (position.distance_to(targetPos) < 3):
		if (targetPos == pos1.position):
			targetPos = pos2.position
		else:
			targetPos = pos1.position
	
	targetDirection = (targetPos - position).normalized()
	
	position += speed * targetDirection
	
	
