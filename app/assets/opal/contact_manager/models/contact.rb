Contact = Struct.new(:id, :first_name, :last_name, :email, :phone, :street, :city, :state, :zip, :created_at, :updated_at, keyword_init: true) do
  ATTRIBUTES_DISPLAY = [:first_name, :last_name, :email, :phone, :street, :city, :state, :zip]
  
  def reset
    self.id = self.first_name = self.last_name = self.email = self.phone = self.street =
      self.city = self.state = self.zip = self.created_at = self.updated_at = nil
  end
end
