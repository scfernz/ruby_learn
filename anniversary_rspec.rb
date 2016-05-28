# Story: As a developer, I can create a to do item for an anniversary (a yearly recurring event) .
# Hint: Do not use Date to store the date.
#
# Story: As a developer, I can print an item for an anniversary with field labels and values.
#
# Story: As a developer with a TaskList with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month.
#
# Story: As a developer with a TaskList with a collection of items with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month, then the items without due dates.

require 'rspec'
require_relative 'anniversary'

describe Anniversary do
  it 'can be created' do
    expect { Anniversary.new(5,1) }.to_not raise_error
  end

  it 'has a month and a day' do
    my_anniversary = Anniversary.new(5,2)
    expect(my_anniversary.yearly_month).to be < 12
    expect(my_anniversary.yearly_month).to be > 0
    expect(my_anniversary.yearly_day).to be < 31
    expect(my_anniversary.yearly_day).to be > 0
  end

  it 'can be printed with field labels and values' do
    my_anniversary = Anniversary.new(5,2)
    expect { my_anniversary.field_label }.to_not raise_error
    puts '......................'
    puts my_anniversary.field_label
  end

  it 'can print out the field label with the anniversary date' do
    my_anniversary = Anniversary.new(12, 31)
    my_anniversary.title = 'New Years Eve'
    my_anniversary.description = 'Day before New Years'
    puts my_anniversary.field_label
    expect(my_anniversary.field_label).to eq 'Title: New Years Eve' + "\n" + 'Description: Day before New Years' + "\n" + 'Date: 12-31-2016'
  end


end
