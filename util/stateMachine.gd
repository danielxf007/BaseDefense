extends Node
signal state_changed(new_state)
class_name StateMachine
export(Dictionary) var states_map: Dictionary = {} #Contains node paths
export(NodePath) var INITIAL_STATE: NodePath
var _active: bool = false
var current_state: State

func _ready():
	if self.states_map.empty() or self.get_children().empty():
		self.set_active(false)
	else:
		self.set_active(true)
		for child in self.get_children():
			child.connect("finished", self, "_change_state")
		if self.INITIAL_STATE:
			self.current_state = self.get_node(self.INITIAL_STATE)
			self.current_state.enter()
			emit_signal("state_changed", self.current_state.name)

func set_initial_state(new_state: NodePath) -> void:
	self.INITIAL_STATE = new_state

func set_states_map(new_states_map: Dictionary) -> void:
	self.states_map = new_states_map

func set_active(value: bool) -> void:
	self._active = value

func _change_state(state_name: String) -> void:
	if self._active:
		self.current_state.exit()
		self.current_state = self.get_node(self.states_map[state_name])
		self.current_state.enter()
		emit_signal("state_changed", state_name)
