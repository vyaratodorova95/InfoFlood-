class SearchController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /search
  # GET /search.json
  
  def index
    @search = Search.search(params[:term]).paginate(page: params[:page])
    
  end

  # GET /search/1
  # GET /search/1.json
  def show
  end

  # GET /search/new
  def new
    @search = Search.new
  end

  # GET /search/1/edit
  def edit
  end

  # POST /search
  # POST /search.json
  def create
    @search = Search.new(search_params)

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search/1
  # PATCH/PUT /search/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search/1
  # DELETE /search/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to search_index_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def search_params
      params.require(:search).permit(:long, :lat, :area, :began, :ended, :dead, :displaced, :maincause, :country_id, :term)
    end
end
