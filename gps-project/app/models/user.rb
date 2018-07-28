class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create -> {self.token = generate_token}
  has_many :coordinates
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  private
  
  def generate_token
    loop do
      token = SecureRandom.hex
      return token unless User.exists?({token: token})
    end
  end
end
