class CreateProfiles < ActiveRecord::Migration  # Created by using bundle exec rails generaate migration "" / Stores information or table
  def change
    create_table :profiles do |t|
      t.integer :user_id # physically ties the two db tables together. (Profile/user)
      t.string :first_name # basic
      t.string :last_name
      t.string :job_title
      t.string :phone_number # pro
      t.string :contact_email
      t.text :description
      
      t.timestamps
    end
  end
end
