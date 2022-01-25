require 'secretdiary'

describe SecretDiary do

  it 'will return error if locked when adding entry' do
    diary = SecretDiary.new
    expect{subject.add_entry("monday", "testing1")}.to raise_error "Unlock diary first"
  end 

  it 'will return error if locked when reading entry' do
    diary = SecretDiary.new
    expect{subject.get_entry("monday")}.to raise_error "Unlock diary first"
  end 

  it 'will allow adding entry when unlocked' do
    diary = SecretDiary.new
    subject.unlock
    expect(subject.add_entry("monday", "testing1")).to eq "Entry added successfully"
  end 

  it 'will allow getting entry when unlocked' do
    diary = SecretDiary.new
    subject.unlock
    subject.add_entry("monday", "testing1")
    expect(subject.get_entry("monday")).to eq "testing1"
  end 

  it 'will allow locking diary again' do
    diary = SecretDiary.new
    subject.unlock
    subject.add_entry("monday", "testing1")
    subject.get_entry("monday")
    subject.lock
    expect{subject.get_entry("monday")}.to raise_error "Unlock diary first"
  end 

end