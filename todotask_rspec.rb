# Story: As a developer, I can create a to do item with a due date, which can be changed.
# Hint: Use the Date class
#
# Story: As a developer, I can print an item with a due date with field labels and values.
#
# Story: As a developer, I can add items with due dates to my TaskList.
# Hint: Consider keeping items with due dates separate from the other items.
#
# Story: As a developer with a TaskList, I can list all the not completed items that are due today.
#
# Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
#
# Story: As a developer with a TaskList with and without due dates, I can show all the not completed items in order of due date, and then the items without due dates.

require 'rspec'
require_relative 'todotask'
require 'date'


describe ToDoTask do
  it 'can be created' do
    expect { ToDoTask.new }.to_not raise_error
  end

  it 'can create a task with a due date' do
    to_do = ToDoTask.new
    expect { to_do.due_date(2016,6,12) }.to_not raise_error
  end

  it 'can change due date' do
    to_do = ToDoTask.new
    to_do.due_date(2017,1,2)
    expect(to_do.due_date?).to eq Date.new(2017,1,2)
  end

end
