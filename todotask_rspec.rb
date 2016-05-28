
# Hint: Use the Date class
#

#
# Hint: Consider keeping items with due dates separate from the other items.
# Story: As a developer, I can add items with due dates to my TaskList.
#
# Story: As a developer with a TaskList, I can list all the not completed items that are due today.

require 'rspec'
require_relative 'todotask'
require 'date'

# a[3].due_date

describe ToDoTask do
  # tests that a todo task can be created without error
  it 'can be created' do
    expect { ToDoTask.new }.to_not raise_error
  end
  # tests that a todo item can be created with a due date
  it 'can create a task with a due date' do
    to_do = ToDoTask.new
    expect { to_do.due_date(2016,6,12) }.to_not raise_error
  end
  # tests that a todo items due date can be changed.
  it 'can change due date' do
    to_do = ToDoTask.new
    to_do.due_date(2017,1,2)
    expect(to_do.due_date?).to eq Date.new(2017,1,2)
  end
  # tests that todo items can have a title
  it 'can have a title' do
    to_do = ToDoTask.new
    to_do.title = 'New Task'
    expect(to_do.title).to eq 'New Task'
  end

  # Story: As a developer, I can print an item with a due date with field labels and values.
  it 'can print a todo: task with a due date with field labels' do
    to_do = ToDoTask.new
    to_do.title = 'Due task'
    to_do.description = 'Task description'
    to_do.due_date(2016,12,14)
    puts '/////////////////////'
    puts to_do.field_label
    puts to_do.due_date?
    expect(to_do.field_label).to eq 'Title: Due task' + "\n" + 'Description: Task description' + "\n" + "Due: 2016-12-14"
  end
end
