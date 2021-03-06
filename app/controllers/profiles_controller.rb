class ProfilesController < ApplicationController 
  before_action :authenticate_user! # from devise gem
  before_action :only_current_user
  
  def new
    # form where a user can fill out their own profile.
    @user = User.find( params[:user_id] ) # reach into db and find the user that is actually logged in/ (tells us who is logged in)
    @profile = Profile.new # .build_profile method is available to us bc we established the model associations btw the users and profiles 
    # The association is located in config/locales/routes.rb
    # Profile.new more dynamic
  end
  
  def create #building it again so we can actually save what the user updated
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile Updated!"
      redirect_to user_path( params[:user_id] )  
    else
      render action: :new  
    end
  end
  
  def edit  # find the profile page under views/profiles then create corresponding file named edit.html.erb
    @user = User.find( params[:user_id] )
    @profile = @user.profile
  end
  
  def update
    @user = User.find( params[:user_id] )
    @profile = @user.profile
      if @profile.update_attributes(profile_params)
        flash[:success] = "Profile Updated!"
        redirect_to user_path( params[:user_id] )
      else
        render action: :edit
      end
        
      
  end
  
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
    end
    
    def only_current_user
      @user = User.find( params[:user_id] )
      redirect_to(root_url) unless @user == current_user
    end
end