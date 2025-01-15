extends Area2D

@export var dialog : String = "Default"


var tempDiag : Node = null

@onready var timer: Timer = %Timer

@onready var animation_player: AnimationPlayer = $text_anim

@onready var dialoge_area: Area2D = $"."

@onready var dialog_layer: CanvasLayer = %Dialog






# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




	

func _on_body_entered(body: Node2D) -> void:
	print("Start Dialog..")
	print(body)
	dialog_layer.get_node("StyleCont/vfcont/Label").text = dialog
	
	dialog_layer.visible = true
	
	
	animation_player.play("text_anim")
	
	
	


func _on_text_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "text_anim":
		print("The Text has been read completly")
		timer.start(3)
		print("Timer started")


		


func _on_timer_timeout() -> void:
	dialog_layer.visible = false
	print("Timer ended... did it start?")
	timer.stop()
