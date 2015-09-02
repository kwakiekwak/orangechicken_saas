class ProfilesController < ApplicationController 
  def new
    # form where a user can fill out their own profile.
    @user = User.find( params[:user_id] ) # reach into db and find the user that is actually logged in/ (tells us who is logged in)
    @profile = @user.build_profile # .build_profile method is available to us bc we established the model associations btw the users and profiles 
    # The association is located in config/locales/routes.rb
  end
    
    
end