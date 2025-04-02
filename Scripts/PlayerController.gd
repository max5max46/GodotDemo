extends CharacterBody2D

@export var speed = 140
@export var gravity = 30
@export	 var terminalVelocityY = 2000
@export	 var terminalVelocityX = 500
@export var friction = 70
@export var runMultiplier = 1.5
@export var jumpForce = 1000;

var terminalVelocityXDefualt

func _ready():
	terminalVelocityXDefualt = terminalVelocityX

func _physics_process(delta):
	var moveLeftRight = Input.get_axis("MoveLeft", "MoveRight"	)
	
	velocity.y += gravity
	
	##Jump
	if Input.is_action_just_pressed("Jump"):
		velocity.y = -jumpForce;
	
	##Running
	if is_on_floor():
		if Input.is_action_pressed("Run"):
			terminalVelocityX = terminalVelocityXDefualt * runMultiplier
		else:
			terminalVelocityX = terminalVelocityXDefualt;
	
	##Left and Right Movement
	velocity.x += speed * moveLeftRight
	
	if velocity.x > 0:
		velocity.x -= friction;
		velocity.x = clamp(velocity.x, 0, terminalVelocityX)
	
	if velocity.x < 0:
		velocity.x += friction;
		velocity.x = clamp(velocity.x, -terminalVelocityX, 0)
	
	velocity.x = clamp(velocity.x, -terminalVelocityX, terminalVelocityX)
	velocity.y = clamp(velocity.y, -terminalVelocityY, terminalVelocityY)
	
	move_and_slide()
