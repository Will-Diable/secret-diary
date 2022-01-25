class SecretDiary

  def initialize
    @locked = true
    @diary = {}
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
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
