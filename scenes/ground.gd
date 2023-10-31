extends MeshInstance3D

const grass_layers: int = 16
const grass_height: float = 0.5
var grass_material = preload("res://materials/grass/grass.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in grass_layers:
		var layer_mesh = MeshInstance3D.new()
		var quad = QuadMesh.new()
		quad.set_size(Vector2(10.0, 10.0))
		quad.set_orientation(PlaneMesh.FACE_Y)
		quad.surface_set_material(0, grass_material.duplicate())
		quad.surface_get_material(0).set("shader_parameter/density", 100)
		quad.surface_get_material(0).set("shader_parameter/height", float(i) / float(grass_layers))
		layer_mesh.set_mesh(quad) 
		layer_mesh.translate_object_local((grass_height / grass_layers) * i * Vector3.UP)
		add_child(layer_mesh)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
