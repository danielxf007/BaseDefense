extends Node

signal state_changed(new_state)
class_name PushDownAutomata
export(Dictionary) var states_map: Dictionary = {} #Contains node paths
export(NodePath) var INITIAL_STATE: NodePath
var states: Array = []
var _active: bool = false
var current_state: HerarchicalState

func _ready():
	if self.states_map.empty() or self.get_children().empty():
		self.set_active(false)
	else:
		self.set_active(true)
		for child in self.get_children():
			child.connect("finished", self, "_change_state")
		if self.INITIAL_STATE:
			self.current_state = self.get_node(self.INITIAL_STATE)
			self.states.append(self.current_state)
			self.current_state.enter()
			emit_signal("state_changed", self.current_state.name)

func set_active(value: bool) -> void:
	self._active = value

func _change_state(state_name: String) -> void:
	if self._active:
		if state_name == "Previous":
			self.states.pop_front()
			self.current_state.exit()
			self.current_state = self.states[0]
			emit_signal("state_changed", state_name)
		else:
			var state: HerarchicalState = self.get_node(
			self.states_map[state_name])
			if state.PRIORITY > self.current_state.PRIORITY:
				self.current_state = self.get_node(self.states_map[state_name])
				self.states.push_front(self.current_state)
				self.current_state.enter()
				emit_signal("state_changed", state_name)
