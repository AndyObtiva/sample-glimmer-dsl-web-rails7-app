class Contact < ApplicationRecord
  STATES = {
    "AK"=>"Alaska", "AL"=>"Alabama", "AR"=>"Arkansas", "AS"=>"American Samoa", "AZ"=>"Arizona",
    "CA"=>"California", "CO"=>"Colorado", "CT"=>"Connecticut", "DC"=>"District of Columbia", "DE"=>"Delaware",
    "FL"=>"Florida", "GA"=>"Georgia", "GU"=>"Guam", "HI"=>"Hawaii", "IA"=>"Iowa", "ID"=>"Idaho", "IL"=>"Illinois",
    "IN"=>"Indiana", "KS"=>"Kansas", "KY"=>"Kentucky", "LA"=>"Louisiana", "MA"=>"Massachusetts", "MD"=>"Maryland",
    "ME"=>"Maine", "MI"=>"Michigan", "MN"=>"Minnesota", "MO"=>"Missouri", "MS"=>"Mississippi", "MT"=>"Montana",
    "NC"=>"North Carolina", "ND"=>"North Dakota", "NE"=>"Nebraska", "NH"=>"New Hampshire", "NJ"=>"New Jersey",
    "NM"=>"New Mexico", "NV"=>"Nevada", "NY"=>"New York", "OH"=>"Ohio", "OK"=>"Oklahoma", "OR"=>"Oregon",
    "PA"=>"Pennsylvania", "PR"=>"Puerto Rico", "RI"=>"Rhode Island", "SC"=>"South Carolina", "SD"=>"South Dakota",
    "TN"=>"Tennessee", "TX"=>"Texas", "UT"=>"Utah", "VA"=>"Virginia", "VI"=>"Virgin Islands", "VT"=>"Vermont",
    "WA"=>"Washington", "WI"=>"Wisconsin", "WV"=>"West Virginia", "WY"=>"Wyoming"
  }
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, allow_blank: true, format: /\A[\w\.-]+@([\w-]+\.)+[\w-]{2,4}\z/
  validates :phone, allow_blank: true, format: /\A[\(]?\d{3}[\)]?[. -]?\d{3}[.-]?\d{4}\z/
  validate :email_or_phone_is_present
  validates :state,
            allow_blank: true,
            inclusion: {
              in: STATES.keys + STATES.values + STATES.values.map(&:upcase),
              message: 'is not a valid US state'
            }
  validates :zip,
            allow_blank: true,
            format: /\A\d{5}(-\d{4})?\z/
  
  private
  
  def email_or_phone_is_present
    if email.blank? && phone.blank?
      errors.add(:email, 'must be present unless phone is present')
      errors.add(:phone, 'must be present unless email is present')
    end
  end
end
