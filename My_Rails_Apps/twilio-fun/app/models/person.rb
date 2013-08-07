class Person < ActiveRecord::Base
  def self.send_mass_message message
    all.each do |person|
      person.send_message message
    end
  end

  def send_message message
    client.account.sms.messages.create(
      :from => "+17606702769",
      :to => formatted_phone_number,
      :body => "#{message}"
    )
  end

  def send_perpetual_message(message, number_of_times=1)
    number_of_times.times { send_message(message) }
  end

  def send_list(*messages)
    messages.each { |item| send_message(item) }
  end

  def formatted_phone_number
    "+1" + phone_number
  end

  private

  def client
    account_sid = "ACbb4c9b9e39b5ab25bf68ecea1ca69fcc"
    auth_token = "58e187c6b90fabd99a447315b4b3b77a"

    Twilio::REST::Client.new(account_sid, auth_token)
  end

end
