class PuppiesController < ApplicationController
  before_action :set_puppy, only: [:show, :edit, :update, :destroy]

  # GET /puppies
  # GET /puppies.json
  def index
    @puppies = Puppy.all
  end

  # GET /puppies/1
  # GET /puppies/1.json
  def show
  end

  # GET /puppies/new
  def new
    @puppy = Puppy.new
    @puppy_list = Puppy.all
  end

  # GET /puppies/1/edit
  def edit
  end

  # POST /puppies
  # POST /puppies.json
  def create

      params["puppies"].each do |puppy|
        if puppy["name"] != "" || puppy["breed"] != ""
          @puppies = Puppy.new(puppy_params(puppy))

        end
      end

      respond_to do |format|
        if @puppies.save
          format.html { redirect_to new_puppy_path, notice: 'Puppy was successfully added.' }
          format.json { render :show, status: :created, location: @candidate }
        else
          format.html { render :new }
          format.json { render json: @candidate.errors, status: :unprocessable_entity }
        end
      end

  end

  # PATCH/PUT /puppies/1
  # PATCH/PUT /puppies/1.json
  def update
    respond_to do |format|
      if @puppy.update(puppy_params)
        format.html { redirect_to @puppy, notice: 'Puppy was successfully updated.' }
        format.json { render :show, status: :ok, location: @puppy }
      else
        format.html { render :edit }
        format.json { render json: @puppy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /puppies/1
  # DELETE /puppies/1.json
  def destroy
    @puppy.destroy
    respond_to do |format|
      format.html { redirect_to puppies_url, notice: 'Puppy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_puppy
      @puppy = Puppy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def puppy_params
    #   params.require(:puppy).permit(:name, :breed)
    # end

    def puppy_params(my_params)
      my_params.permit(:name, :breed)
    end








end
