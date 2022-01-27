require 'secretdiary'
require 'key'

describe SecretDiary do

  it 'will return error if locked when adding entry' do
    expect{subject.add_entry("monday", "began Makers challenge")}.to raise_error "Unlock diary first"
  end 

  it 'will return error if locked when reading entry' do
    expect{subject.get_entry("monday")}.to raise_error "Unlock diary first"
  end 

  it 'will allow adding entry when unlocked' do
    key = Key.new
    key.unlock(subject)
    expect(subject.add_entry("monday", "began Makers challenge")).to eq "Entry added successfully"
  end 

  it 'will allow getting entry when unlocked' do
    key = Key.new
    key.unlock(subject)
    subject.add_entry("monday", "began Makers challenge")
    expect(subject.get_entry("monday")).to eq "began Makers challenge"
  end

end