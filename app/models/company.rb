class Company < ApplicationRecord
	has_many :comments, dependent: :destroy
end
