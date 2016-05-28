require_relative 'task'
require_relative 'todotask'
require_relative 'anniversary'

# Make class Tasklisk which can contain tasks
class Tasklist
  # Create empty array which can hold tasks
  def initialize
    @agenda = []
    @agenda_due = []
    @anniversary_day = []
  end

  # Getter for tasks
  def agenda
    @agenda
  end

  def agenda_due
    @agenda_due
  end

  def anniversary_agenda
    @anniversary_day
  end

  # Story: As a developer, I can add all of my Tasks to a TaskList.
  def add_task(new_task)
    @agenda << new_task
  end

  def add_due(new_task)
    @agenda_due << new_task
  end

  def add_anniversary(new_task)
    @anniversary_day << new_task
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

  def sort_undone_due
    @agenda_due.select { |e| e.done? == false }
  end

  def due_today
    @agenda_due.select { |e| e.done? == false && e.due_date? == Date.today }
  end

  def due_later
    @agenda_due.select { |e| e.done? == false && e.due_date? != Date.today }
  end

  def sorted_by_date
    self.sort_undone_due.sort_by { |e| e.due_date?}
  end

  # Story: As a developer with a TaskList with and without due dates, I can show all the not completed items in order of due date, and then the items without due dates.
  def sorted_tasks
    self.anniversary_agenda.concat(self.sorted_by_date.concat(self.sort_undone))
  end
end
