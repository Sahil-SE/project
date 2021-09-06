class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
 has_many :role_users
 has_many :casestudy_users
 has_many :roles, through: :role_users
 has_many :assessors
 has_many :casestudies, through: :casestudy_users
 has_many :user_responses
 has_many :casestudies, class_name: "Casestudy", foreign_key: "contentcreator_id"

 validates :name, presence:true, length: {minimum: 3}
 validates :email, presence:true, uniqueness: true, format: Devise.email_regexp
 
after_create :assign_role

   def assign_role
      role_users.create(user_id: self.id, role_id: Role.find_by(name: "student").id)
      
   end
end
