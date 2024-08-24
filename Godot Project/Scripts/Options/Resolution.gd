extends OptionButton
#Resolution
# Called when the node enters the scene tree for the first time.
func _ready():
	if Variables.Resolution == "800x600":
		Variables.selected_resolution_ID = 0
	if Variables.Resolution == "1280x720":
		Variables.selected_resolution_ID = 1
	if Variables.Resolution == "1920x1080":
		Variables.selected_resolution_ID = 2
	if Variables.Resolution == "2560x1440":
		Variables.selected_resolution_ID = 3
	if Variables.Resolution == "3840x2160":
		Variables.selected_resolution_ID = 4
		
	self.connect("item_selected", Callable(self, "on_selected"))
	self.add_item(" 800x600")
	self.add_item(" 1280x720")
	self.add_item(" 1920x1080")
	self.add_item(" 2560x1440")
	self.add_item(" 3840x2160")
	
	Variables._save_settings()
	
	self.select(Variables.selected_resolution_ID)

func on_selected(nothing):
	Variables.selected_resolution_ID = self.get_selected_id()
	Variables.Resolution = self.get_item_text(self.get_selected_id())
	Variables._save_settings()
	Variables.Set_Settings()

