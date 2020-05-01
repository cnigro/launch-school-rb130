# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

require_relative "todo"

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # do the rest

end