require 'gmail'

class Mailer
  def initialize(arr)
    @info = arr
  end

  def send_emails
    gmail = Gmail.connect("bonjambonneau38", "thpthp38")

    @info.each do |town|
      if !town["email"].empty? && !town["email"].nil?
        email = gmail.compose do

          to town["email"]
          subject "The Hacking Project"
          body "Bonjour,
  Je m'appelle Charles, je suis eleve à The Hacking Project, une formation au code gratuite, sans locaux, sans selection, sans restriction geographique. La pedagogie de ntore ecole est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'education pour tous. Dejà 500 personnes sont passees par The Hacking Project. Est-ce que la mairie de #{town["ville"]} veut changer le monde avec nous ? Charles, co-fondateur de The Hacking Project pourra repondre à toutes vos questions : 06.95.46.60.80"
        end
      email.deliver! 
      end
    end
    gmail.logout
  end

  def perform
    send_emails
  end
end
