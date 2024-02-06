class GlobalParametersController < ApplicationController
  before_action :set_global_parameter, only: %i[ show edit update destroy ]

  # GET /global_parameters or /global_parameters.json
  def index
    @global_parameters = GlobalParameter.all
  end

  # GET /global_parameters/1 or /global_parameters/1.json
  def show
  end

  # GET /global_parameters/new
  def new
    @global_parameter = GlobalParameter.new
  end

  # GET /global_parameters/1/edit
  def edit
  end

  # POST /global_parameters or /global_parameters.json
  def create
    @global_parameter = GlobalParameter.new(global_parameter_params)

    respond_to do |format|
      if @global_parameter.save
        format.html { redirect_to global_parameter_url(@global_parameter), notice: "Global parameter was successfully created." }
        format.json { render :show, status: :created, location: @global_parameter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @global_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /global_parameters/1 or /global_parameters/1.json
  def update
    respond_to do |format|
      if @global_parameter.update(global_parameter_params)
        format.html { redirect_to global_parameter_url(@global_parameter), notice: "Global parameter was successfully updated." }
        format.json { render :show, status: :ok, location: @global_parameter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @global_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /global_parameters/1 or /global_parameters/1.json
  def destroy
    @global_parameter.destroy

    respond_to do |format|
      format.html { redirect_to global_parameters_url, notice: "Global parameter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_global_parameter
      @global_parameter = GlobalParameter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def global_parameter_params
      params.require(:global_parameter).permit(:description, :code)
    end
end
