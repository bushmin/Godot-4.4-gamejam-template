extends Camera2D


func _ready():
	pass


# How quickly to move through the noise
@export var NOISE_SHAKE_SPEED = 1500.0
# Noise returns values in the range (-1, 1)
# So this is how much to multiply the returned value by
@export var NOISE_SHAKE_STRENGTH = 120.0
# Multiplier for lerping the shake strength to zero
@export var SHAKE_DECAY_RATE = 10.0
@onready var rand = RandomNumberGenerator.new()
@onready var noise = FastNoiseLite.new()

var noise_i: float = 0.0
var shake_strength: float = 0.0
var real_shake_strength: float = 0.0
	
func _process(delta):
	# Fade out the intensity over time
	real_shake_strength = lerp(real_shake_strength, shake_strength, SHAKE_DECAY_RATE * delta)

	# Shake by adjusting camera.offset so we can move the camera around the level via it's position
	self.offset = get_noise_offset(delta)
	
###################

func shake(intensity = 1.0):
	shake_strength = NOISE_SHAKE_STRENGTH*intensity

func get_noise_offset(delta: float):
	noise_i += delta * NOISE_SHAKE_SPEED

	return Vector2(
		noise.get_noise_2d(1, noise_i) * real_shake_strength,
		noise.get_noise_2d(100, noise_i) * real_shake_strength
	)
