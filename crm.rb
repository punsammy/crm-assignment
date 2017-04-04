require_relative 'contact.rb'
class CRM

  def initialize
    @run = true
  end

  def main_menu
    while @run == true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then @run = false            #can also get rid of all @run and just put 'exit'
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "What contact id would you like to update?"
    contact_id = gets.chomp

  end

  def delete_contact
    puts "What contact id would you like to delete?"
    contact_id = gets.chomp.to_i
    contact = Contact.find(contact_id)
    contact.delete
  end

  def display_all_contacts
    contacts = Contact.all
    contacts.each do |contact|
      puts "#{contact.first_name} #{contact.last_name}"
    end
  end

  def search_by_attribute
    puts "Type the contact attribute you are searching for"
    attribute = gets.chomp
    puts "Type the value you are searching for"
    value = gets.chomp
    contact = Contact.find_by(attribute, value)
    puts "#{contact.first_name} #{contact.last_name}"
  end

end

Contact.create("amanda", "punsammy", "amandaemail", "laptop")
Contact.create("person", "somename", "email", "birthday")

crm = CRM.new
crm.main_menu
