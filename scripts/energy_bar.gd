extends HBoxContainer

var tempnode : Node = null

@onready var stats_handler: Node = get_tree().current_scene.get_node("StatsHandler")

@onready var energy_bar: HBoxContainer = $"."


func prepare_templateNode() -> Node:
	if tempnode:
		return tempnode

	var TR = TextureRect.new()
	
	var tex = AtlasTexture.new()
	
	var energy_asset = load("res://assets/EnergySprite.png")
	tex.atlas = energy_asset
	tex.region = Rect2(166,57.819,159, 341.428)
	
	TR.texture = tex
	TR.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
	TR.stretch_mode = TextureRect.STRETCH_SCALE
	
	return TR


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var StartEnergy = stats_handler.CurrentEnergyState
	stats_handler.connect("ErodeBar",Callable(self, "_On_energy_Erode"))
	
	tempnode = prepare_templateNode()
	
	for i in range(StartEnergy):
		var clonedNode = tempnode.duplicate()
		energy_bar.add_child(clonedNode)
		
		
	

func _On_energy_Erode() -> void:
	if energy_bar.get_children().size() >= 1:
		energy_bar.get_child(0).free()
	else:
		pass
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
