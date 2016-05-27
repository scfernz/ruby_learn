# Story: As a developer, I can create a Task.
#
# Story: As a developer, I can give a Task a title and retrieve it.
#
# Story: As a developer, I can give a Task a description and retrieve it.
#
# Story: As a developer, I can print a Task with field labels and values.
#
# Story: As a developer, I can mark a Task done.
#
# Story: As a developer, when I print a Task is done status is shown.
#
# Story: As a developer, I can add all of my Tasks to a TaskList.
#
# Story: As a developer with a TaskList, I can show all the completed items.
#
# Story: As a developer with a TaskList, I can show all the not completed items.
# Make Tasklist rspec

require 'rspec'
require_relative 'tasklist'
require_relative 'task'

describe Tasklist do
  it 'can be created' do
    expect { Tasklist.new }.to_not raise_error
  end

  it 'can hold tasks in an array' do
    my_tasklist = Tasklist.new
    expect(my_tasklist.agenda).to be_a Array
  end

  it 'can add tasks' do
    my_tasklist = Tasklist.new
    my_task = Task.new
    expect { my_tasklist.add_task(my_task) }.to_not raise_error
  end

  it 'can show completed tasks' do
    my_tasklist = Tasklist.new
    my_task = Task.new
    my_task2 = Task.new
    my_task.done = true
    my_tasklist.add_task(my_task)
    my_tasklist.add_task(my_task2)
    expect(my_tasklist.sort_done).to eq [my_task]
  end

  it 'can show incomplete tasks' do
    my_tasklist = Tasklist.new

    my_task = Task.new
    my_task2 = Task.new
    my_task.done = true
    my_tasklist.add_task(my_task)
    my_tasklist.add_task(my_task2)
    expect(my_tasklist.sort_undone).to eq [my_task2]
  end
end
