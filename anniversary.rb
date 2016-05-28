require_relative 'task'
require 'date'

class Anniversary < Task
  def initialize(month,day)
    @yearly_month = month
    @yearly_day = day
  end

  def yearly_month
    @yearly_month
  end

  def yearly_day
    @yearly_day
  end

  def field_label
    @field_label = "Title: #{@title}" + "\n" + "Description: #{@description}" + "\n" + "Date: #{@yearly_month}-#{@yearly_day}-" + Date.today.year.to_s
  end
end
