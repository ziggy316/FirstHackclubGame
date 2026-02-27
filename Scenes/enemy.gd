extends Node2D


const speed = 60

var direction = 1


@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_castleft: RayCast2D = $RayCastleft
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		anim_sprite.flip_h = true
		
	if ray_castleft.is_colliding():
		direction = 1
		anim_sprite.flip_h = false
	
	position.x += direction * speed * delta
