module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_filter :set_page_defaults
  end

  def set_page_defaults
    @page_title = 'Anastasiia Vlasova | My Portfolio'
    @seo_keywords = 'Anastasiia Vlasova portfolio'
  end
end