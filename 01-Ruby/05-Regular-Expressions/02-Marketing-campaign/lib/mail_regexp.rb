def valid?(email)
  # TODO: return true if the email is valid, false otherwise
  email.match?(/\w*@\w*\.\w*/)
end

def clean_database(emails)
  emails.select do |email|
    valid?(email)
  end
  # TODO: return an array with the valid emails only
end

def group_by_tld(emails)
  fr = []
  com = []
  de = []
  emails.each do |email|
    com << email.to_s if email.match?(/.com$/)
    de << email.to_s if email.match?(/.de$/)
    fr << email.to_s if email.match?(/.fr$/)
  end
  { "com" => com, "de" => de, "fr" => fr }
end

def compose_mail(email)
  hash = {}
  email.scan(/@\w*/) { |user| hash[:domain] = user[1..] }
  email.scan(/\.\w*/) { |user| hash[:tld] = user[1..] }
  email.scan(/\w*@/) { |user| hash[:username] = user.chop }
  hash
  # TODO: return a Hash with username, domain and tld extracted from email
end

def translate(lang)
  local = {
    en: {
      subject: "Our website is online",
      body: "Come and visit us!",
      closing: "See you soon",
      signature: "The Team"
    },
    fr: {
      subject: "Notre site est en ligne",
      body: "Venez nous rendre visite !",
      closing: "A bientot",
      signature: "L'équipe"
    },
    de: {
      subject: "Unsere Website ist jetzt online",
      body: "Komm und besuche uns!",
      closing: "Bis bald",
      signature: "Das Team"
    }
  }

  case lang
  when "com"
    local[:en]
  when "fr"
    local[:fr]
  when "de"
    local[:de]
  end
end

def compose_translated_email(email)
  mail = translate(compose_mail(email)[:tld])
  mail.merge(compose_mail(email))
  # TODO: return a Hash with username, domain and tld extracted from email
  # TODO: translate subject, body, closing and signature, according to TLD
end
