class ProfilesController < ApplicationController 
  def new
    # form where a user can fill out their own profile.
    @user = User.find( params[:user_id] ) # reach into db and find the user that is actually logged in/ (tells us who is logged in)
    @profile = @user.build_profile # .build_profile method is available to us bc we established the model associations btw the users and profiles 
    # The association is located in config/locales/routes.rb
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
  
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
          
    end
end