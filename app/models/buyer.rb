class Buyer < ActiveRecord::Base
  has_many :purchases
  has_many :cars, through: :purchases
end
