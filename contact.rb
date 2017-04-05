class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

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


  def self.find_by(attribute, value)
    case attribute
    when "first_name"
      result = @@contacts.find { |contact| contact.first_name == value}
      return result
    when "last_name"
      result = @@contacts.find { |contact| contact.last_name == value}
      return result
    when "email"
      result = @@contacts.find { |contact| contact.email == value}
      return result
    when "note"
      result = @@contacts.find { |contact| note_name == value}
      return result
    end
  end

  def self.delete_all
    @@contacts.clear
  end

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  def update(attribute, value)
    contact = self
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

  def full_name
    "#{first_name} #{last_name}"
  end

  def delete
    @@contacts.delete(self)    #self in this context is the instance
    return true
  end

  #another way to delete is
  # contact_to_delete_id = self.id
  # @@contacts.delete_if { |contact| contact_to_delete_id == contact.id }

end
# amanda = Contact.create("amanda", "punsammy", "amandaemail", "laptop")
# person = Contact.create("person", "somename", "email", "birthday")
