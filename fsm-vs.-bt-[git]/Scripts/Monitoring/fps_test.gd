extends Node
class_name Monitoring

@export var npc_spawner: NpcSpawner
var fps_data: Dictionary = {}

func _enter_tree() -> void:
	# FpsTimer
	var fps_timer = Timer.new()
	fps_timer.wait_time = 1.0
	fps_timer.autostart = true
	fps_timer.one_shot = false
	fps_timer.timeout.connect(_on_fps_timer_timeout)
	add_child(fps_timer)

func _on_fps_timer_timeout() -> void:
	var npc_count: int = npc_spawner.get_current_npc_count()
	var fps: int = Performance.get_monitor(Performance.TIME_FPS)
	if not fps_data.has(npc_count):
		fps_data[npc_count] = {}
	if fps_data[npc_count].has(fps):
		fps_data[npc_count][fps] += 1
	else:
		fps_data[npc_count][fps] = 1

func save_data(file_path: String, data) -> void:
	var file: FileAccess = FileAccess.open(file_path, FileAccess.WRITE)
	var json_string = JSON.stringify(data)
	if file:
		file.store_line(json_string)
		file.close()
		print("PlanLength-Daten gespeichert unter: ", file_path)
	else:
		print("Fehler beim Öffnen der Datei!")

func _exit_tree() -> void:
	var timestamp: String = Time.get_datetime_string_from_system().replace(" ", "_").replace(":", "-")
	save_data("C:/Users/Oleg/fps_data/fsm_fps_data_"+ timestamp +".json", fps_data)
