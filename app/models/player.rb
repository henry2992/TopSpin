class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 

  	include Redis::Objects
  	sorted_set :leaderboard, global: true
  	after_update :update_leaderboard

  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  	devise :omniauthable, :omniauth_providers => [:facebook]

  	validates :email, presence: true
  	validates :first_name, presence: true
  	validates :last_name, presence: true

  	

 	  has_many :player_challenges, :dependent => :destroy
  	has_many :player_medals, :dependent => :destroy

  	
  	def update_leaderboard
    	self.class.leaderboard[id] = points
  	end


    def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |player|
	    player.provider   = auth.provider 
	    player.uid        = auth.uid
	    player.email      = auth.info.email
	    player.first_name = auth.info.first_name
      	player.last_name  = auth.info.last_name
	    player.password   = Devise.friendly_token[0,20]
	    player.oauth_token = auth.credentials.token
	    player.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    player.avatar = auth.info.image.gsub('http://','https://')
	    player.save!
		end
	end

	 def my_rank
    	self.class.leaderboard.revrank(id) + 1
  	end

    def is_admin?
      self.admin
    end
   

end
