extends CharacterBody2D


const SPEED = 180.0
const JUMP_VELOCITY = -280.0

@onready var anim2d: AnimatedSprite2D = $AnimatedSprite2D



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	animations(direction)
	
	
func animations(direction):
	
	if direction > 0:
		anim2d.flip_h = false
	elif direction < 0:
		anim2d.flip_h = true
		
	if is_on_floor():
		if direction == 0:
			anim2d.play("idle")
		else:
			anim2d.play("run")
	else:
		anim2d.play("jump")
		
	
	
	
	
