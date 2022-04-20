extends Node
#CONTAINS ALL METHODS

func delete(object):
	object.call_deferred('queue_free')

func add(object, child):
	object.call_deferred('add_child',child)
