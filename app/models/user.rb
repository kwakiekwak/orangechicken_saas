class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan
  has_one :profile # linked to app/models/profile.rb
  attr_accessor :stripe_card_token
  
  def save_with_payment
    if valid? # checks for validation/ then it sends off the user the information to stripe 
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_card_token = customer.id  # it was self.stripe_customer_token = customer.id
      save!
    end
  end
end