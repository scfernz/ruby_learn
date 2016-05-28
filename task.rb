# Make Class Task which includes a title, desciption, and completion status
class Task
  def initialize
    @done = false
  end

  # Story: As a developer, I can give a Task a title
  def title=(new_title)
    @title = new_title
  end

  # Story: As a developer, I can retrieve a task
  def title
    @title
  end

  # Story: As a developer, I can give a Task a description
  def description=(new_description)
    @description = new_description
  end

  # Story: As a developer, I can retrieve a task description.
  def description
    @description
  end

  # Story: As a developer, I can print a Task with field labels and values.
  def field_label
    @field_label = "Title: #{@title}" + "\n" + "Description: #{@description}"
  end

  # Story: As a developer, I can mark a Task done.
  def done=(status)
    @done = status
  end

  # Story: As a developer, when I print a Task is done status is shown.
  def done?
    @done
  end
end
