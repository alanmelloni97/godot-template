"
- RESOURCES:
resources can be local to the scene or be saved on //res as a .tres file. If they are local,
they will be lost when removing, so if the resource has much info its better to save it to //res
	- Make unique: when putting a saved resource on an export field, it will be linked to the .tres
	file. Making it unique makes it local to the scene. This means following changes to the .tres
	file wont be reflected on the exported local resource.
	- Local to scene: the resource will still be linked to the .tres file in the editor, but when the
	game runs it will be made local to the scene, meaning the link is lost. following changes made to
	the .tres file wont be reflected on the local resource. this is useful for example when having an
	enemy with a EnemyStats resource, that you wouldnt want to have it share between all enemies. but
	changes to the .tres file will still be reflected on the editor.
The diference between 'make unique' and 'local to scene' is if the resource is a local copy in the editor
or not
	- New: creates new resource that isnt saved in //res so it will be local
	- Load: loads a resource from //res so it will be linked
	- Save: saves a unique local resource to a .tres file
To make a linked resource local by code, one can call the duplicate() method. Unfortunately this is bugged
and it returns the same linked resource. Even duplicate(deep = true) doesnt work. The new method
duplicate_deep() works as intended and does return a local to scene resource. docs say
duplicate(deep = true) and duplicate_deep() are the same but this is false.

- RESOURCESAVER:
When saving a resource that has an array of resources the behaviour depends on if this resources are
local to the scene or not:
	- resources are local to the scene: they get saved and all of their contents.
	- resources are links to a .tres file: only a reference to the .tres file will be saved, but not
	the contents of that file
There is a flag in ResourceSaver.Save: FLAG_BUNDLE_RESOURCES that supposedly saves also the linked
resources but a bug about hiding a global variable happens when using it if the resources are custom.
this probably works for built in resources only.

- RIGIDBODY:
	Rotation property of a rigidbody is different to the one of Node2D. Instead of 0 to 360 it goes
	-180 to 180. Also adding rotation past 360 to a node2d makes the value keep going further than
	 360 and the  rotation behaves as expected. in rigidbody adding past 180 makes the rotation reset
	its better to rotate only the sprite of the rigidbody and not the body if thats possible.


- TWEEN:
	When tweening a property again before it finished tweening, it won't play. For example when
	pressing a button rapidly. To avoid this, the tween should be declared on the top of the script
	and then on the function check for tween.is_running(), then kill it so that it can restart:

##############################################
var tween: Tween

func foo():
	if tween and tween.is_running():
		tween.kill()
	tween.tween_property(self, scale, 0,1)
##############################################


- NAVIGATION:
	To carve the navmesh, a Polygon2D or a NavigationObstacle2D can be used. The NavigationObstacle2D
	needs the property 'Affect Navigation Mesh' to be set. They have to be children of the mesh to take
	effect.


- THEMES:
	There is currently no global color font, so white will be default for everything and has to be
	overwritten everywhere

- EXPORT:
	When showing a shader, particle effect or light for the first time, the game compiles the shaders
	and a stutter happens. To avoid this see:
		https://docs.godotengine.org/en/stable/tutorials/performance/pipeline_compilations.html
	in compatibility mode, the only solution is to show this shaders and effects for one frame when
	starting the game

- Sprite2D:
	To generate a CollisionPolygon2D from a sprite, there is an option to do so from the editor. To
	do it with code, the bitman class has to be used: 
		https://shaggydev.com/2022/04/13/sprite-collision-polygons/

- Build from source to optimize size:
	The godot configuration tool to remove unused classes will remove necesary features. To today,
	the build.gdbuild has to be edited to remove the following lines:
		Mutex
	
	On top of applying this tool, a couple of extra commands can be used:
		optimize=size_extra
	Also, from the configuratino tool, the advanced text server can be disabled and the fallback
	enabled (not made by default)
		







"
