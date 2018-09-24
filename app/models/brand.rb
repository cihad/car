class Brand < ApplicationRecord
  has_one_attached :logo
  has_many :models
  accepts_nested_attributes_for :models
  validates_uniqueness_of :name


  def to_param
    name.parameterize
  end
end
