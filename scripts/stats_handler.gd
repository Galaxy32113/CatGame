extends Node

@onready var energy_erode: Timer = %EnergyErode

const EnergyTime = 15 #600 seconds = 10 minutes

const EnergyDelay = 5 #Amount of energy erroded over the energy time
var currentTime: float = 0.0


#Planning to convert health to this stats handler when i figure out
#what to do with it... 



signal ErodeBar
signal EnergyOut

signal energyReqRes(energyRes)

var CurrentEnergyState : int = 5

func _ready():
	currentTime = Time.get_unix_time_from_system()
	energy_erode.start(EnergyTime/CurrentEnergyState)
	print('Energy State is running')


func _process(delta) -> void:
	
	pass

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		print("meow")


func _on_energy_erode_timeout() -> void:
	if CurrentEnergyState < 1:
		print("You have run out of energy...")
		emit_signal("EnergyOut")
		return
		
	print("Energy erode has timed out")
	emit_signal("ErodeBar")
	CurrentEnergyState -= 1
	
	
	
	energy_erode.stop()
	energy_erode.start()
	
	
