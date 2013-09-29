class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  # def self.by_gender(gender)
  #   where(gender: gender)
  # end

  scope :male, -> { where(gender: 'm') }

end
