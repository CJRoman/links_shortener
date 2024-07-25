class Link < ApplicationRecord
  validates :token, uniqueness: true
end
