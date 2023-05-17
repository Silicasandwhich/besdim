extends Area2D

@export var speed: float = 100
@export var location: String
var next_location: String
var emergency_level: float = 1
var enabled = true
var prev_location: String
var speed_multiplier = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	next_location = location
	prev_location = location


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().is_class("PathFollow2D") and enabled:
		get_parent().progress += delta * speed * speed_multiplier
		if get_parent().progress_ratio >= 1:
			location = next_location
			prev_location = location

func follow_path(path: PathFollow2D, start_angle: float):
	self.prev_location = location
	self.location = "hallway"
	if get_parent() :
		get_parent().remove_child(self)
	path.add_child(self)
	path.progress_ratio = 0
	self.rotation = start_angle
	self.position = Vector2(0,0)
	self.speed_multiplier = emergency_level
	
func set_speed_multiplier(mult: float):
	self.speed_multiplier = mult
