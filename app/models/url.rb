class Url < ApplicationRecord
  validate :url_check
end
