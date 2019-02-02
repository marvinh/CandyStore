class Stock < ApplicationRecord
  belongs_to :candy
  belongs_to :shelf
end
