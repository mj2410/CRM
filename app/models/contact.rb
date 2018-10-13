class Contact < ApplicationRecord
	has_many :calls, dependent: :delete_all
	validates :last_name, :mobile_number, presence: true
end
