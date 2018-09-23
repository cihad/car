class Model < ApplicationRecord
  belongs_to :brand
  has_ancestry
end
