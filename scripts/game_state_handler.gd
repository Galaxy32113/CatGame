extends Node

@onready var stats_handler: Node = %StatsHandler

var state = "Playing"


@onready var energy_card_screen: CanvasLayer = %Energy_Card_Screen
@onready var card_timer: Timer = %Card_timer

func _ready() -> void:
	print("Current State is playing")
	stats_handler.connect("EnergyOut", Callable(self, "_on_energy_out"))
	
	
func _on_energy_out() -> void:
	print("Game State Handler has registered Energy out")
	state = "Depleted_Energy"
	
	energy_card_screen.visible = true
	
	pass
