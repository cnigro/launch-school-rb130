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

# # Adding to the list
list.add(todo1)
list.add(todo2)
list.add(todo3)
# p list.add(1) # TypeError

# # <<
# # same behavior as add
# p list << todo1
# p list << 1

# # Interrogating the list
# p list.size  # return 3
# p list.first # return todo1
# p list.last  # return todo3
# p list.to_a  # return array of all todos
# p list.done? # return true if all todos are done, else false

# # Retrieving an item from th elist
# p list.item_at      # ArgumentError
# p list.item_at(1)   # return 2nd item
# p list.item_at(100) # IndexError

# # Marking items in the list
# p list.mark_done_at      # ArgumentError
# p list.mark_done_at(1)   # Mark 2nd item as done
# p list.mark_done_at(100) # IndexError

# list.mark_undone_at      # ArgumentError
# list.mark_undone_at(1)   # Mark 2nd item as not done
# list.mark_undone_at(100) # IndexError

# list.done! # Mark all items as done

# # Deleting from the list
# list.shift          # remove and return first item in list
# list.pop            # remove and return last item in list
# list.remove_at      # ArgumentError
# p list.remove_at(1)   # remove and return 2nd item
# p list.remove_at(100) # IndexError

# # Output the list
puts list.to_s # return string representation of the list
