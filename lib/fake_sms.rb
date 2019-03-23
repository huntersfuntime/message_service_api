module FakeSms
  Message = Struct.new(:num, :msg, :app)
  @messages = [] # acts as active record

  def self.send_sms(num, msg, app)
    @messages << Message.new(num, msg, app)
  end

  def self.messages
    @messages
  end
end