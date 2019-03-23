require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'creation' do
    it 'can be created' do
      notification = Notification.create(phone: 5555555555, body: 'My message', source_app: 'some_app')
      expect(notification).to be_valid
    end
  end

  describe 'validations' do
    it 'can be created if valid' do
      notification = Notification.create(phone: nil, body: nil, source_app: nil)
      expect(notification).to_not be_valid
    end
  end

  it 'requires the phone attribute to contain a string of integers' do
    notification = Notification.create(phone: 'atextphonenumber', body: 'My message', source_app: 'some_app')
    expect(notification).to_not be_valid
  end

  it 'requires the phone attribute to only have 10 characters' do
    notification = Notification.create(phone: 12345678901, body: 'My message', source_app: 'some_app')
    expect(notification).to_not be_valid
  end

  it 'limits the body attribute to 160 characters' do
    notification = Notification.create(phone: 5555555555, body: "word" * 500, source_app: 'some_app')
    expect(notification).to_not be_valid
  end

end
