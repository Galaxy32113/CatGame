extends HBoxContainer



var player :Node = null

var plr_Total_Health : float = 5.0


var atlas_Tex : Texture


var TemplateNodes :Dictionary = {}
@onready var healthbar: HBoxContainer = $"."


#Important to note... FH = full heart, HH = half heart, ZH = zero heart

func update_hearts(FH : int, HH: int, ZH: int, NodeDict: Dictionary): 
	
	for child in healthbar.get_children():
		child.queue_free()
	
	var Type := "FH"
	
	print(NodeDict)
	for i in range(FH+HH+ZH):
		print(Type)
		add_child(NodeDict[Type].duplicate())
		if i == FH - 1:
			Type = "HH"
		elif i == HH + FH - 1:
			Type = "ZH"




func produce_template_nodes() -> Dictionary:
	if TemplateNodes.size() > 0:
		return TemplateNodes
		
	var TempNode_FullHealth : Node = TextureRect.new()
	var TempNode_HalfHealth : Node = TextureRect.new()
	var TempNode_ZeroHealth : Node = TextureRect.new()
	
	

	var atlas_Tex := load("res://assets/Sprout Lands - UI Pack - Basic pack/Sprout Lands - UI Pack - Basic pack/Sprite sheets/Sprite sheet for Basic Pack.png")
	
	var tex = AtlasTexture.new()
	var tex2 = AtlasTexture.new()
	var tex3 = AtlasTexture.new()
	
	tex.atlas = atlas_Tex
	tex2.atlas = atlas_Tex
	tex3.atlas = atlas_Tex
	
	
	
	var FullHealth_Reg = Rect2(576.721,111.6,15.8,15.56)
	var HalfHealth_Reg = Rect2(593.986,111.6,15.8,15.56)
	var ZeroHealth_Reg = Rect2(609.893,111.6,15.8,15.56)
	
	tex.region = FullHealth_Reg
	TempNode_FullHealth.texture = tex
	tex2.region = HalfHealth_Reg
	TempNode_HalfHealth.texture = tex2
	tex3.region = ZeroHealth_Reg
	TempNode_ZeroHealth.texture = tex3
	
	
	
	

	
	TempNode_FullHealth.expand_mode = TextureRect.EXPAND_FIT_WIDTH
	TempNode_HalfHealth.expand_mode = TextureRect.EXPAND_FIT_WIDTH
	TempNode_ZeroHealth.expand_mode = TextureRect.EXPAND_FIT_WIDTH
	
	
	var TemplateNodes :Dictionary = {"FH":TempNode_FullHealth, "HH":TempNode_HalfHealth, "ZH":TempNode_ZeroHealth}
	return TemplateNodes
	
	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Dis does fire incase ur wonderinglol")
	
	var TempNodeDict :Dictionary = produce_template_nodes() 
	
	var plr :Node = get_tree().current_scene.find_child("player")
	
	plr.connect("health_changed", Callable(self, "_on_health_changed"))
	plr_Total_Health = plr.Total_health
	
	update_hearts(plr_Total_Health, 0, 0, produce_template_nodes())
	print(plr_Total_Health)
	print("Hearts Should be updated...")
	



func _on_health_changed(health):
	print("The health has been changed to: "+health)
	var HalfH := 0
	
	if (health%1) == 0.5:
		HalfH = 1
	
	update_hearts(floor(health), HalfH, floor(plr_Total_Health - health), produce_template_nodes())
	

	
	
