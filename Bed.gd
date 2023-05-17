extends Area2D


@export var speed: float = 10.0
@export var patrol_path: PathFollow2D



# Called when the node enters the scene tree for the first time.
func _ready():
	set_fixed_pocess(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	patrol_path.set_progress(patrol_path.get_progress() + 0.0001 * delta)
	
	
	

