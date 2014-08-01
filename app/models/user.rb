class User

	attr_reader :password
	attr_accessor :password_confirmation

	include DataMapper::Resource

	validates_confirmation_of :password

	property :id, Serial
	property :username, String
	property :name, Text
	property :email, String
	property :password_digest, Text

	has n, :posts

	def password=(password)
  	@password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(:username => username) 
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end