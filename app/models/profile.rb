class Profile < ActiveRecord::Base
    belongs_to :user  # linked to app/models/user.rb
end