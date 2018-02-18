require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

def contact_map
  contacts = read_contacts
  puts
  print contacts.map {|contact| {contact[:name] => contact[:phone]}}
end

def contact_select_phone
  contacts = read_contacts
  puts
  print contacts.select {|contact| contact[:phone].include? "+1"}
end

def contact_select_email
  contacts = read_contacts
  puts
  print contacts.select {|contact| contact[:email].include? ".org"}
end

puts
contact_map
contact_select_phone
contact_select_email
