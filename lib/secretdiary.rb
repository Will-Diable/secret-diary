require_relative 'key'

class SecretDiary

  attr_reader :locked

  def initialize
    @locked = true
    @diary = {}
  end

  def add_entry(day, note)
    fail "Unlock diary first" if @locked
    @diary[day] = note
    return "Entry added successfully"
  end

  def get_entry(day)
    fail "Unlock diary first" if @locked
    @diary[day]
  end

end
