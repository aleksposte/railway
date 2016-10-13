class Ticket < ActiveRecord::Base
  # Принадлежит user
  belongs_to :user

  # Принадлежит route
  belongs_to :route

  # Принадлежит train
  belongs_to :train
end
