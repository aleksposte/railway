class User < ActiveRecord::Base

  # Много tikets
  has_many :tikets
end
