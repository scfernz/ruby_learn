require 'rspec'
require_relative 'task.rb'

# Test to check that we can create a new task object with class 'Task'
describe Task do
  it 'can make a task' do
    expect { Task.new }.to_not raise_error
  end

  it 'can have a title' do
    my_task = Task.new
    expect(my_task.make_title('title')).to be_a String
  end

  it 'can have a retrievable title' do
    my_task = Task.new
    my_task.make_title('New Title')
    expect(my_task.show_title).to eq 'New Title'
  end

  it 'can have a description' do
    my_task = Task.new
    expect(my_task.make_description('Do dishes')).to be_a String
  end

  it 'can have a retrievable description' do
    my_task = Task.new
    my_task.make_description('Do dishes')
    expect(my_task.show_description).to eq 'Do dishes'
  end

  it 'can make field values' do
    my_task = Task.new
    my_task.make_title('Chores')
    my_task.make_description('Do dishes')
    expect(my_task.field_label).to be_a String
  end

  it 'can print field values' do
    my_task = Task.new
    my_task.make_title('Chores')
    my_task.make_description('Do dishes')
    expect(my_task.field_label).to eq 'Chores - Do dishes'
  end

  it 'can mark a task is done' do
    my_task = Task.new
    my_task.done = true
    expect(my_task.done?).to eq true
  end

  it 'can check a task is done' do
    my_task = Task.new
    my_task.done?
    expect(my_task.done?).to eq false
  end
end
