extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("Container/AnimatedSprite2D")
@onready var container = get_node("Container")

@export var attacking = false

@onready var music = $AudioStreamPlayer2D

func _ready():
	GameController.player=self
	music.play()

	
func _process(_delta):
	if Input.is_action_just_pressed("attack"):
		attack()

func _physics_process(delta):
	# Nếu chạm đất thì bị kéo xuống do trọng lực
	if not is_on_floor():
		velocity.y += gravity * delta

	# Xử lý nhảy
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Xử lý trái, phải
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		container.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	#xử lý chuyển động
	if not is_on_floor():
		anim.play("Jump")
	elif direction:
		anim.play("Run")
	else:
		anim.play("Idle");
	move_and_slide()
	
	if position.y >= 600:
		die()

func attack():
	var overlapping_objects = $AttackArea.get_overlapping_areas()
	
	for area in overlapping_objects:
		if area.get_parent().is_in_group("Enemy"):
			var parent = area.get_parent()
			print(parent.name)
			area.get_parent().die()
		
	attacking = true
	anim.play("Attack")


#Khi chet thi respawn 
func die():
	GameController.respawn_player()


