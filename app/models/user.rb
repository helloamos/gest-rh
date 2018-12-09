class User < ApplicationRecord

  #extend FriendlyId
	#friendly_id :name, use: :slugged
	#@user = User.friendly.find(params[:id]) In controller
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable,  :validatable #, :trackable,


	# Fields validations.
	validates :email, uniqueness: true
	validates :role, presence: true
	validates :full_name, presence: true
	#validates :login, presence: true
	

	# User relationships.

	has_many :conges
	has_many :avancements
	has_many :mutations
	has_many :sanctions
	has_many :services

	has_many :demissions
	has_many :fonctions

	
	
	# Find users by roles and authors.
	def self.find_by_role_and_creator(role, user)
		where("role = ? AND created_by = ?", "#{role}", user)
	end

	# Find users by roles and authors.
	def self.is_contributor(full_name, user)
		where("full_name = ? AND created_by = ? ",  full_name, user)
	end

	# Find users by roles and authors.
	def self.is_producer(full_name, user)
		where("full_name = ? AND created_by = ? ",  full_name, user)
	end

	# Find users by authors.
	def self.find_by_created_by(user)
		where("created_by = ? ", "#{user.id}")
	end

	# Find users by authors.
	def self.find_by_fullname(name)
		where("full_name = ? ", "#{user}")
	end

	# Find user by fulle_name.

    def self.exist?(full_name)
		where("full_name = ? ", "#{user}")
    end

	# Find user by role ("Apporteur or Producteur")
	def self.find_user_by_role(role1, role2)
		where("role = ? OR role = ?", "#{role1}", "#{role2}")
	end


	# For Paperclip usage
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "200x200>" }, default_url: "/images/avatar/:style/missing.png",  validate_media_type: false
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	validates_attachment :avatar,  :file_dimensions

	# Image dimensions validation
	def file_dimensions
		dimensions = Paperclip::Geometry.from_file(file.queued_for_write[:original].path)
		self.width = dimensions.width
		self.height = dimensions.height

		if dimensions.width < 200 && dimensions.height < 200
			errors.add(:file,'Width or height must be at least 50px')
		end
	end
end
