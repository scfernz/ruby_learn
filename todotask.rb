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

require_relative 'task'
require 'date'

class ToDoTask < Task
  def due_date(year,month,day)
    @due_date = Date.new(year,month,day)
  end

  def due_date?
    @due_date
  end

  def field_label
    @field_label = "Title: #{@title}" + "\n" + "Description: #{@description}" + "\n" + "Due: #{@due_date}"
  end
end
