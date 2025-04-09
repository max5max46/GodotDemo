extends StaticBody2D

@export var speed = 2
@export var waitTime = 1

var targetPos
var targetDirection
var previousPos
var movementDelta
var pos1
var pos2
var waitTimer = 0
var playerOnPlatform
var player

func _ready():
	pos1 = get_node("/root/Level/MovingPlatform/Pos1")
	pos2 = get_node("/root/Level/MovingPlatform/Pos2")
	
	targetPos = pos1.position
	
	previousPos = position

func _process(delta):
	movementDelta = position - previousPos
	previousPos = position
	
	if (playerOnPlatform):
		player.position += movementDelta
	
	if (waitTimer >= 0):
		waitTimer -= delta

func _physics_process(delta):
	
	if (position.distance_to(targetPos) < 3):
		if (targetPos == pos1.position):
			targetPos = pos2.position
		else:
			targetPos = pos1.position
		waitTimer = waitTime
	
	targetDirection = (targetPos - position).normalized()
	
	if (waitTimer < 0):
		position += speed * targetDirection
	

func _on_character_entered(body: Node2D):
	playerOnPlatform = true;
	player = body


func _on_character_exited(body: Node2D):
	playerOnPlatform = false;
