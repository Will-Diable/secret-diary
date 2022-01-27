class Key

  def unlock(diary)
    fail "Already open" if diary.locked == false
    diary.instance_variable_set(:@locked, false)
    "Open"
  end

  def lock(diary)
    fail "Already locked" if diary.locked == true
    diary.instance_variable_set(:@locked, true)
    "Locked"
  end
  
end
