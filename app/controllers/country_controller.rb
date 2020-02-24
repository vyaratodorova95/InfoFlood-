class CountryController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_if_not_found
  
  def api
    @countries = Country.all
    render json: @countries
  end
  

  # GET /country
  # GET /country.json
  def index
    @country = Country.all
  end

  # GET /country/1
  # GET /country/1.json
  def show
  end

  # GET /country/new
  def new
    @country = Country.new
  end

  # GET /country/1/edit
  def edit
  end

  # POST /country
  # POST /country.json
  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /country/1
  # PATCH/PUT /country/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to @country, notice: 'Country was successfully updated.' }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /country/1
  # DELETE /country/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to country_index_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_params
    params.require(:country).permit(:name) 
   end
  
end
