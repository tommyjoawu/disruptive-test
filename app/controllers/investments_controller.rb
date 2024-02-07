class InvestmentsController < ApplicationController

  include ActionView::Helpers::NumberHelper
  include CoinsHelper
  require 'roo'
  require 'json'

  before_action :set_investment, only: %i[ show edit update destroy download_as_csv]

  # GET /investments or /investments.json
  def index
    @investments = Investment.all
  end

  # GET /investments/1 or /investments/1.json
  def show
    @records = @investment.coin_instances
    tries = 0
    while @records.empty? && tries <= 3
      @investment.create_coin_instances
      @records = @investment.coin_instances
      tries += 1
      sleep 2
      puts "Failed Creating Coin Instances -- API ERROR"
    end

    respond_to do |format|
      format.html
      format.csv { send_data @investment.records_to_csv, filename: "investment_#{@investment.id}_exchange_rates_#{DateTime.now.strftime("%d%m%Y%H%M")}.csv"}
      # json_data = @records.to_json(include: :investment)

      json_data = @records.to_json(include: {
        investment: {},
        coin: {}
      })
      format.json { send_data json_data, filename: "investment_#{@investment.id}_exchange_rates_#{DateTime.now.strftime("%d%m%Y%H%M")}.json" }      
    end
  end

  # GET /investments/new
  def new
    @investment = Investment.new
    @coins = Coin.all
    @exchange_rates = get_all_coins_exchange_rates
  end

  # GET /investments/1/edit
  def edit
  end

  # POST /investments or /investments.json
  def create
    @investment = Investment.new(investment_params)

    respond_to do |format|
      if @investment.save
        format.html { redirect_to investment_path(@investment), notice: "Investment was successfully created." }
        format.json { render :show, status: :created, location: @investment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investments/1 or /investments/1.json
  def update
    respond_to do |format|
      if @investment.update(investment_params)
        format.html { redirect_to investment_url(@investment), notice: "Investment was successfully updated." }
        format.json { render :show, status: :ok, location: @investment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investments/1 or /investments/1.json
  def destroy
    @investment.destroy

    respond_to do |format|
      format.html { redirect_to investments_url, notice: "Investment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment
      @investment = Investment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def investment_params
      params.require(:investment).permit(:balance, :currency)
    end
end
