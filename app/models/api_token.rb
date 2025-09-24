class ApiToken < ApplicationRecord
  belongs_to :user
  has_secure_token :value
end
