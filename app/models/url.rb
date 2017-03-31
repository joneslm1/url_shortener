class UrlValidator < ActiveModel::Validator
  def validate(record)
    if record.original_url.starts_with? 'http://'
    elsif record.original_url.starts_with? 'https://'
    elsif record.original_url.blank?
      record.errors[:original_url] << 'needs to be real!'
    else
      record.errors[:original_url] << 'needs to start with http:// or https:// please!'
    end
  end
end


class Url < ApplicationRecord
include ActiveModel::Validations
validates_with UrlValidator

end
