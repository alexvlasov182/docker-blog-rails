class PortfoliosController < ApplicationController
  before_action :set_portfolios, only: %i[edit show update]

  def index
    @portfolio_items = Portfolio.all
  end

  def show; end

  def new
    @portfolio_item = Portfolio.new
  end

  def edit; end

  def create
    @portfolio_item = Portfolio.new(portfolios_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolios_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio item is updated' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_portfolios
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolios_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end

end
