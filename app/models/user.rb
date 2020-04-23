class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role

  def has_role?(user_role)
    self.role.name == user_role
  end

  Role.all.each do |role|
    define_method "is_#{role.name}?" do
      has_role?(role.name)
    end
  end
end
