require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

@contacts = read_contacts

def contact_map
  puts "Here are the contacts and their phone numbers:"
  print @contacts.map {|contact| {contact[:name] => contact[:phone]}}
  puts
end

def contact_select_phone
  puts "Contacts which phone numbers contain \"+1\":"
  print @contacts.select {|contact| contact[:phone].include? "+1"}
end

def contact_select_email
  puts "Contacts which emails contain \".org\":"
  print @contacts.select {|contact| contact[:email].include? ".org"}
end

def contact_reduce_phone
  phone = @contacts.select {|contact| contact[:phone].include? "+1"}
  print "Number of contacts: "
  print phone.reduce(0) {|sum, contact| sum += (contact.count/3)}
  puts
end

def contact_reduce_email
  email = @contacts.select {|contact| contact[:email].include? ".org"}
  print "Number of contacts: "
  print email.reduce(0) {|sum, contact| sum += (contact.count/3)}
  puts
end

puts
contact_map
puts
contact_select_phone
puts
contact_reduce_phone
puts
contact_select_email
puts
contact_reduce_email
puts
