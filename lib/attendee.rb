class Attendee
  attr_reader :name, :budget
  def initialize(attendee_info)
    @name = attendee_info[:name]
    @budget = attendee_info[:budget]

  end
end