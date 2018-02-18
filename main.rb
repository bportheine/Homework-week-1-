require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

def map
  contacts = read_contacts
  print contacts.map {|contact| {contact[:name] => contact[:phone]}}
end

map
