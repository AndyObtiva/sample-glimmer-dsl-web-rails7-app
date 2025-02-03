Contact = Struct.new(:id, :first_name, :last_name, :email, :phone, :street, :city, :state, :zip, :created_at, :updated_at, keyword_init: true) do
  ATTRIBUTES_DISPLAYABLE = [:first_name, :last_name, :email, :phone, :street, :city, :state, :zip]
end
