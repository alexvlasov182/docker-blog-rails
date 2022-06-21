class Technology < ApplicationRecord
  belongs_to :portfolio, dependent: :destroy
end