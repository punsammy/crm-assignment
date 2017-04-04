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
  def self.find_by
    @@contacts.each do |contact|
      if value = contact.first_name
        return
      elsif value = contact.last_name
        return
      elsif value = contact.email
        return
      end
    end
  end



  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete

  end

  # Feel free to add other methods here, if you need them.

end
