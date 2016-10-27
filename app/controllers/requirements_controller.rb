class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy]

  # GET /requirements
  # GET /requirements.json
  def index
    @requirements = Requirement.all
  end

  # GET /requirements/1
  # GET /requirements/1.json
  def show
  end

  # GET /requirements/new
  def new
    @requirement = Requirement.new
    @job = Job.find(params[:job_id])
  end

  # GET /requirements/1/edit
  def edit
  end

  # POST /requirements
  # POST /requirements.json
  def create

    params["requirements"].each do |requirement|
      @job = Job.find(requirement["job_id"])
      if requirement["name"] != "" || requirement["level"] != "" || requirement["requirement_type"] != "" || requirement["importance"] != "" || requirement["job_id"] != ""
        @requirement =   Requirement.new(requirement_params(requirement))
        @requirement.save
      end
    end

    respond_to do |format|
      if @requirement.save
        format.html { redirect_to @job, notice: 'Requirement was successfully created.' }
        format.json { render :show, status: :created, location: @requirement }
      else
        format.html { render :new }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requirements/1
  # PATCH/PUT /requirements/1.json
  def update
    respond_to do |format|
      if @requirement.update(requirement_params)
        format.html { redirect_to @requirement, notice: 'Requirement was successfully updated.' }
        format.json { render :show, status: :ok, location: @requirement }
      else
        format.html { render :edit }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    @job = Job.find(params[:job_id])
    @requirement.destroy
    respond_to do |format|
      format.html { redirect_to @job, notice: 'Requirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requirement
      @requirement = Requirement.find(params[:id])
    end

    # # Never trust parameters from the scary internet, only allow the white list through.
    # def requirement_params
    #   params.require(:requirement).permit(:name, :level, :importance, :job_id, :name1, :level2, :importance3, :job_id4)
    # end

    def requirement_params(my_params)
      my_params.permit(:name, :level, :importance, :requirement_type, :job_id)
    end

end
