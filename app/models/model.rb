class Model < ApplicationRecord
  belongs_to :brand
  has_ancestry
  has_many_attached :images
end
