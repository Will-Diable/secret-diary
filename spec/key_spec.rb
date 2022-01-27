require 'secretdiary'
require 'key'

describe Key do

  it {is_expected.to respond_to}

  it 'can unlock diary' do
    diary = SecretDiary.new
    expect(subject.unlock(diary)).to eq "Open"
  end

  it 'can lock diary again' do
    diary = SecretDiary.new
    subject.unlock(diary)
    expect(subject.lock(diary)).to eq "Locked"
  end

  it 'will raise error when locking if already locked' do
    diary = SecretDiary.new
    expect{subject.lock(diary)}.to raise_error "Already locked"
  end

  it 'will raise error when unlocking if already unlocked' do
    diary = SecretDiary.new
    subject.unlock(diary)
    expect{subject.unlock(diary)}.to raise_error "Already open"
  end

end