extends Area2D
var bed1
var bed2
@export var area: String = "PR1"
@export var debug: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	bed1 = get_node("%BED1")
	bed2 = get_node("%BED2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if bed1 in self.get_overlapping_areas() and bed2 in self.get_overlapping_areas():
		if bed1.prev_location == area:
			if debug:
				print("should stop 1")
			bed1.enabled = false
			bed2.enabled = true
		else:
			if debug:
				print("shoudl stop 2")
			bed2.enabled = false
			bed1.enabled = true
	else:
		if bed1 in self.get_overlapping_areas():
			bed1.enabled = true
		if bed2 in self.get_overlapping_areas():
			bed2.enabled = true
