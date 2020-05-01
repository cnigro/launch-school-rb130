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

  def add(item)
    if item.is_a? Todo
      @todos << item
    else
      raise TypeError.new("Can only add Todo objects")
    end
  end

  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    @todos.each_index { |idx| mark_done_at(idx) }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    selection = TodoList.new(title)
    each do |todo|
      selection << todo if yield(todo)
    end
    selection
  end

  def to_s
    text = "#{title}\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo
end

todo1.done!

results = list.select do |todo|
  todo.done?
end

p results
