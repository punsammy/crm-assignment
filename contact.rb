class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  def self.all
    @@contacts
  end

  def self.find(id)
    @@contacts.find do |contact|
      contact.id == id
    end
  end

  def update(id, attribute, value)
    contact = Contact.find(id)
    case attribute
      when "first_name"
        contact.first_name = value
      when "last_name"
        contact.last_name = value
      when "email"
        contact.email = value
      when "note"
        contact.note = value
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    case attribute
    when "first_name"
      result = @@contacts.select { |contact| contact.first_name == value}
      return result[0]
    when "last_name"
      result = @@contacts.select { |contact| contact.last_name == value}
      return result[0]
    when "email"
      result = @@contacts.select { |contact| contact.email == value}
      return result[0]
    when "note"
      result = @@contacts.select { |contact| note_name == value}
      return result[0]
    end
  end



  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    contact_to_delete_id = self.id #find ID number
    @@contacts.delete_if { |contact| contact_to_delete_id == contact.id }  #will iterate throught the array and find the contact with the same ID number and then delete it
  end

  # Feel free to add other methods here, if you need them.

end

amanda = Contact.create("amanda", "punsammy", "amandaemail", "new backpack")
puts amanda.inspect
