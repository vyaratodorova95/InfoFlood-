class LocationController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_if_location_not_found

  # GET /location
  # GET /location.json
  def index
    @location = Location.all
     @country = Country.all
    @location_names = []
    @country_names = []
 
    @country.each do |country|
      @country_names << country.name
    end

    @location_groups = Location.all.group('country_id').count('id')

     @locations = []
     @location_groups.each do |group|
     @locations << group[1]
   end
  end


  # GET /location/1
  # GET /location/1.json
  def show
  end

  # GET /location/new
  def new
    @location = Location.new
    @country = Country.all
  end

  # GET /location/1/edit
  def edit
    @country = Country.all
  end

  # POST /location
  # POST /location.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location/1
  # PATCH/PUT /location/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location/1
  # DELETE /location/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to location_index_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:location).permit(:long, :lat, :area, :country_id)
    end
end
