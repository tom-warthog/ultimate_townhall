require 'gmail'





class Mailer
  def initialize(arr)
    @arr = arr
  end

  def send_emails
    gmail = Gmail.connect("bonjambonneau38", "thpthp38")

    @arr.each do |town|

      email = gmail.compose do
        to town["email"]
        subject "Je spam des gens "
        body "Fiacre"
      end
      email.deliver! # or: gmail.deliver(email)
    end
    gmail.logout
  end

  def perform
    send_emails
  end
end
