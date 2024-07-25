class Link < ApplicationRecord
  validates :token, uniqueness: true
  validates_format_of :full_link, with: URI::regexp
end
