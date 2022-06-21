class PagesController < ApplicationController
  def home
  end

  def about
    @skills = Skill.all
  end

  def contact
  end
end
