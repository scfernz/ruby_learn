# Make Class Task which includes a title, desciption, and completion status
class Task
  def initialize
    @done = false
  end

  # Story: As a developer, I can give a Task a title
  def make_title(new_title)
    @title = new_title
  end

  # Story: As a developer, I can retrieve a task
  def show_title
    @title
  end

  # Story: As a developer, I can give a Task a description
  def make_description(new_description)
    @description = new_description
  end

  # Story: As a developer, I can retrieve a task description.
  def show_description
    @description
  end

  # Story: As a developer, I can print a Task with field labels and values.
  def field_label
    @field_label = "#{@title}" + ' - ' + "#{@description}"
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
