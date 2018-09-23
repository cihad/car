class Brand < ApplicationRecord
  has_one_attached :logo
  has_many :models
  validates_uniqueness_of :name


  def to_param
    name.parameterize
  end
end
