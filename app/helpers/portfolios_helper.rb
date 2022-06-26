module PortfoliosHelper
  def image_generator(height:, width:)
    "https://place-hold.it/#{height}x#{width}.jpg/888/fff/000"
  end

  def portfolio_img img, type
    if img.model.main_image? || img.model.thumb_image?
      img
    elsif type == 'thumb'
      image_generator(height: '350', width: '200')
    elsif type == 'main'
      image_generator(height: '600', width: '400')
    end
  end
end
