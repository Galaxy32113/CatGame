extends CanvasLayer

@export var label_Text = "This is a label"
@export var button_1_Text = "This is button 1"
@export var button_2_Text = "This is button 2"

@onready var main_button_1: Button = $ColorRect/VBoxContainer/VBoxContainer/mainButton_1
@onready var main_button_2: Button = $ColorRect/VBoxContainer/VBoxContainer/mainButton_2

@onready var main_text: Label = $ColorRect/VBoxContainer/Main_text


signal Button_pressed_1
signal Button_pressed_2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_button_1.text = button_1_Text
	main_button_2.text = button_2_Text
	main_text.text = label_Text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_main_button_1_pressed() -> void:
	print("Button 1 was clicked restarting the game to previous checkpoint")




func _on_main_button_2_pressed() -> void:
	print("Button2 was pressed quitting game...")
