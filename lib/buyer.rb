class Buyer < ActiveRecord::Base
  has_many :purchases
  has_many :cars, through: :purchases


  def self.find_by_name(name)
    self.where(name: name).first
  end
end
