class Model < ApplicationRecord
  belongs_to :brand
  has_ancestry
  has_many_attached :images
  has_many :prices
  accepts_nested_attributes_for :prices, reject_if: proc { |attributes| attributes[:price].blank? }
  has_one :price, -> { order(created_at: :desc) }
end
