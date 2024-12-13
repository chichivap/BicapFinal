extends Node2D
@onready var false_spawner_component: SpawnerComponent = $FalseSpawnerComponent
@onready var true_spawner_component: SpawnerComponent = $TrueSpawnerComponent

@onready var remove_spawner_component: SpawnerComponent = $RemoveSpawnerComponent
@onready var append_spawner_component: SpawnerComponent = $AppendSpawnerComponent

var margin = 8
var scree_width = ProjectSettings.get_setting("display/window/size/viewport_width")
@onready var first_timer: Timer = $FirstTimer
@onready var second_timer: Timer = $SecondTimer
@onready var third_timer: Timer = $ThirdTimer
@onready var fourth_timer: Timer = $FourthTimer
@onready var fifth_timer: Timer = $FifthTimer
@onready var sixth_timer: Timer = $SixthTimer

@export var FirstAsteroid: PackedScene
@export var SecondAsteroid: PackedScene

@export var RemoveAsteroid: PackedScene
@export var AppendAsteroid: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	first_timer.timeout.connect(handle_false_spawn.bind(FirstAsteroid,second_timer ))
	second_timer.timeout.connect(handle_true_spawn.bind(SecondAsteroid,second_timer ))
	third_timer.timeout.connect(handle_false_spawn.bind(FirstAsteroid,second_timer ))
	fourth_timer.timeout.connect(handle_true_spawn.bind(SecondAsteroid,second_timer ))
	fifth_timer.timeout.connect(handle_append_spawn.bind(AppendAsteroid))
	sixth_timer.timeout.connect(handle_remove_spawn.bind(RemoveAsteroid))
func handle_false_spawn(first_scene: PackedScene,timer: Timer) -> void:
	false_spawner_component.scene = first_scene
	false_spawner_component.spawn(Vector2(randf_range(margin, scree_width - margin), -16))
	
	#timer.start()
func handle_true_spawn(second_scene: PackedScene,timer: Timer) -> void:
	true_spawner_component.scene = second_scene
	true_spawner_component.spawn(Vector2(randf_range(margin, scree_width - margin), -16))

func handle_append_spawn(third_scene) -> void:
	append_spawner_component.scene = third_scene
	append_spawner_component.spawn(Vector2(randf_range(margin, scree_width - margin), -16))
	
func handle_remove_spawn(fourth_scene) -> void:
	remove_spawner_component.scene = fourth_scene
	remove_spawner_component.spawn(Vector2(randf_range(margin, scree_width - margin), -16))
