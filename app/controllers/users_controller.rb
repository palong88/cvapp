class UsersController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @team = Team.where.not(name: 'Everyone')
  end

  def edit
    @user = User.find(params[:id])
    @team = Team.where.not(name: 'Everyone')
  end


    if params[:category]
      ap "Option 1"
      @eadmin_tasks = EadminTask.where(:category => params[:category], :user_id => my_id_param).where( :team => params[:team])

    else
      ap "Option 2"
      redirect_to :controller => 'users', :action => 'eadmin_tasks', :category => Category.where(:team => "Everyone").first.name, :team => "Everyone"

    end

  end



  def create
    @user = User.new(user_params)
    @eadmin_tasks = AdminTask.all

    if @user.save
      redirect_to @user, :flash => { :success => 'Employee was successfully created.' }
    else
      render :action => 'new'
    end
  end


  def new_eadmin

    @eadmin_task = current_user.eadmin_tasks.build
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      sign_in(@user, :bypass => true) if @user == current_user
      redirect_to users_path, :flash => { :success => 'User was successfully updated.' }
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    redirect_to users_path, :flash => { :success => 'User was successfully deleted.' }
  end

  def promote_to_admin
    @user = User.find(params[:id])
    @user.promote_to_admin
    redirect_to users_path, notice: "They are now an admin!"
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :company)
  end

end
