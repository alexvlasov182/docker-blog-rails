class PortfoliosController < ApplicationController
  before_action :set_portfolios, only: %i[edit show update destroy]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :edit]}, site_admin: :all
  layout 'portfolio'

  def index
    @portfolio_items = Portfolio.by_position
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def show; end

  def new
    @portfolio_item = Portfolio.new
  end

  def edit; end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio item is updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio_item.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed'}
      format.json { head :no_content }
    end
  end

  private

  def set_portfolios
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
  end

end
