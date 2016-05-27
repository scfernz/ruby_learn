require_relative 'task'

# Make class Tasklisk which can contain tasks
class Tasklist
  # Create empty array which can hold tasks
  def initialize
    @agenda = []
  end

  # Getter for tasks
  def agend
    @agenda
  end

  # Story: As a developer, I can add all of my Tasks to a TaskList.
  def add_task(new_task)
    @agenda << new_task
  end

  # Story: As a developer with a TaskList, I can show all the completed items.
  def sort_done
    @agenda.select { |e| e.done? == true }
  end

  # Story: As a developer with a TaskList
  # I can show all the not completed items.
  def sort_undone
    @agenda.select { |e| e.done? == false }
  end
end
