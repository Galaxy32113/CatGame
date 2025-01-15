extends CharacterBody2D


const SPEED = 100
const JUMP_VELOCITY = -400.0


signal health_changed(cHealth)

var Total_health : float = 5.0
var Current_health := 3.5

var current_Energy : int = 5


func change_Health(health):
	Current_health += health
	emit_signal("health_changed", Current_health)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("left", "right", "forward", "backwards")
	velocity = direction * SPEED 
	
	move_and_slide()
	

func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("inventory")) == true :
		print("Inventory was opened")
