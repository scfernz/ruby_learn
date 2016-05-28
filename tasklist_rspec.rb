# Make Tasklist rspec

require 'rspec'
require_relative 'tasklist'
require_relative 'task'

describe Tasklist do
  # Story: As a developer, I can create a Task.
  it 'can be created' do
    expect { Tasklist.new }.to_not raise_error
  end
  # Story: As a developer, I can give a Task a title and retrieve it.
  # Story: As a developer, I can give a Task a description and retrieve it.
  it 'can hold tasks in an array' do
    my_tasklist = Tasklist.new
    expect(my_tasklist.agenda).to be_a Array
  end
  # Story: As a developer, I can add all of my Tasks to a TaskList.
  it 'can add tasks' do
    my_tasklist = Tasklist.new
    my_task = Task.new
    expect { my_tasklist.add_task(my_task) }.to_not raise_error
  end
  # Story: As a developer with a TaskList, I can show all the completed items.
  it 'can show completed tasks' do
    my_tasklist = Tasklist.new
    my_task = Task.new
    my_task2 = Task.new
    my_task.done = true
    my_tasklist.add_task(my_task)
    my_tasklist.add_task(my_task2)
    expect(my_tasklist.sort_done).to eq [my_task]
  end
  # Story: As a developer with a TaskList, I can show all the not completed items.
  it 'can show incomplete tasks' do
    my_tasklist = Tasklist.new
    my_task = Task.new
    my_task2 = Task.new
    my_task.done = true
    my_tasklist.add_task(my_task)
    my_tasklist.add_task(my_task2)
    expect(my_tasklist.sort_undone).to eq [my_task2]
  end

  it 'can add tasks with due dates' do
    my_tasklist = Tasklist.new
    due_task = ToDoTask.new
    expect { my_tasklist.add_task(due_task) }.to_not raise_error
  end

  it 'can show tasks that are due today' do
    my_tasklist = Tasklist.new
    due_soon = ToDoTask.new
    due_next_month = ToDoTask.new
    my_tasklist.add_due(due_soon)
    my_tasklist.add_due(due_next_month)
    due_soon.title = 'Finish tasklist'
    due_soon.description = 'Ruby challenge'
    due_soon.due_date(2016,5,27)
    due_next_month.title = 'Finish stuff'
    due_next_month.description = 'Stuff challenge'
    due_next_month.due_date(2016,6,15)
    expect(my_tasklist.due_today).to eq [due_soon]
    puts '-------------'
    puts Date.today
  end

  it 'can show tasks that are not due today' do
    my_tasklist = Tasklist.new
    due_soon = ToDoTask.new
    due_next_month = ToDoTask.new
    my_tasklist.add_due(due_soon)
    my_tasklist.add_due(due_next_month)
    due_soon.title = 'Finish tasklist'
    due_soon.description = 'Ruby challenge'
    due_soon.due_date(2016,5,27)
    due_next_month.title = 'Finish stuff'
    due_next_month.description = 'Stuff challenge'
    due_next_month.due_date(2016,6,15)
    expect(my_tasklist.due_later).to eq [due_next_month]
    puts '++++++++++++'
    puts Date.today
    p my_tasklist
    p [due_next_month]
  end

  # Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
  it 'can list all incomplete items in order of due date' do
    my_tasklist = Tasklist.new
    due_soon = ToDoTask.new
    due_next_week = ToDoTask.new
    due_next_month = ToDoTask.new
    due_next_year = ToDoTask.new
    my_tasklist.add_due(due_soon)
    my_tasklist.add_due(due_next_month)
    my_tasklist.add_due(due_next_week)
    my_tasklist.add_due(due_next_year)
    due_soon.title = 'Finish tasklist'
    due_soon.description = 'Ruby challenge'
    due_soon.due_date(2016,5,27)
    due_next_year.title = 'Pay fees'
    due_next_year.description = 'Loan fees'
    due_next_year.due_date(2017,8,29)
    due_next_month.title = 'Finish stuff'
    due_next_month.description = 'Stuff challenge'
    due_next_month.due_date(2016,6,15)
    due_next_week.title = 'Finish rails app'
    due_next_week.description = 'Ruby on rails challenge'
    due_next_week.due_date(2016,6,04)
    puts '$$$$$$$$$$$$$$$$$$$$$'
    p my_tasklist
    p my_tasklist.sorted_by_date
    expect(my_tasklist.sorted_by_date).to eq [due_soon, due_next_week, due_next_month, due_next_year]
  end

  # Story: As a developer with a TaskList with and without due dates, I can show all the not completed items in order of due date, and then the items without due dates.
  it 'can list task items in order of due date with and without due dates' do
    my_tasklist = Tasklist.new
    due_soon = ToDoTask.new
    due_next_week = ToDoTask.new
    due_next_month = ToDoTask.new
    someday = Task.new
    dream_task = Task.new
    my_tasklist.add_due(due_soon)
    my_tasklist.add_due(due_next_month)
    my_tasklist.add_due(due_next_week)
    my_tasklist.add_task(someday)
    my_tasklist.add_task(dream_task)
    dream_task.title = 'Learn Chinese'
    dream_task.description = 'Take lessons'
    due_soon.title = 'Finish tasklist'
    due_soon.description = 'Ruby challenge'
    due_soon.due_date(2016,5,27)
    someday.title = 'Pay fees'
    someday.description = 'Loan fees'
    due_next_month.title = 'Finish stuff'
    due_next_month.description = 'Stuff challenge'
    due_next_month.due_date(2016,6,15)
    due_next_week.title = 'Finish rails app'
    due_next_week.description = 'Ruby on rails challenge'
    due_next_week.due_date(2016,6,04)
    expect(my_tasklist.sorted_tasks).to eq [due_soon, due_next_week, due_next_month, someday, dream_task]
  end

  it 'can list all tasks including dated, non-dated tasks, and anniversary dates' do
    my_tasklist = Tasklist.new
    due_soon = ToDoTask.new
    due_next_week = ToDoTask.new
    due_next_month = ToDoTask.new
    someday = Task.new
    dream_task = Task.new
    thanksgiving = Anniversary.new(11,24)
    my_tasklist.add_anniversary(thanksgiving)
    my_tasklist.add_due(due_soon)
    my_tasklist.add_due(due_next_month)
    my_tasklist.add_due(due_next_week)
    my_tasklist.add_task(someday)
    my_tasklist.add_task(dream_task)
    dream_task.title = 'Learn Chinese'
    dream_task.description = 'Take lessons'
    due_soon.title = 'Finish tasklist'
    due_soon.description = 'Ruby challenge'
    due_soon.due_date(2016,5,27)
    someday.title = 'Pay fees'
    someday.description = 'Loan fees'
    due_next_month.title = 'Finish stuff'
    due_next_month.description = 'Stuff challenge'
    due_next_month.due_date(2016,6,15)
    due_next_week.title = 'Finish rails app'
    due_next_week.description = 'Ruby on rails challenge'
    due_next_week.due_date(2016,6,04)
    expect(my_tasklist.sorted_tasks).to eq [thanksgiving, due_soon, due_next_week, due_next_month, someday, dream_task]
    expect(my_tasklist.sorted_tasks.length).to eq 6
    puts '##############'
    puts my_tasklist.sorted_tasks
  end
end
