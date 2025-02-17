Contact = Struct.new(:id, :first_name, :last_name, :email, :phone, :street, :city, :state, :zip, :created_at, :updated_at, keyword_init: true) do
  ATTRIBUTES_DISPLAY = [:first_name, :last_name, :email, :phone, :street, :city, :state, :zip]
  
  attr_accessor :errors
  
  def reset
    self.id = self.first_name = self.last_name = self.email = self.phone = self.street =
      self.city = self.state = self.zip = self.created_at = self.updated_at = nil
  end
  
  def load_with(other_contact)
    members.each { |attribute| self[attribute] = other_contact[attribute] }
  end
  
  def error_message
    return nil if errors.nil?
    errors.reduce('') do |output, error|
      error_attribute, error_values = error
      error_string = error_values.map { |error_value| "#{error_attribute.titlecase} #{error_value}" }.join(', ')
      separator = ',' unless output == ''
      "#{output}#{separator} #{error_string}"
    end
  end
  
  def attribute_error_message(error_attribute)
    return nil if errors.nil?
    error_values = errors[error_attribute.to_s]
    return nil if error_values.nil?
    error_values.map { |error_value| "#{error_attribute.titlecase} #{error_value}" }.join(', ')
  end
end
