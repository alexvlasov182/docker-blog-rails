class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body

  def self.angular
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails, -> {where(subtitle: "Ruby on Rails")}
end


#TODO
# - added to validates_prensence_of main_image thumb_image