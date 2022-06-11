class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body
end


#TODO
# - added to validates_prensence_of main_image thumb_image