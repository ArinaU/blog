class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable, :registerable

  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable

	has_many :comments
	has_many :articles

	#belongs_to :role

  ROLES = %i[editor reader].freeze

  def roles=(roles)
    roles = [*roles].map(&:to_sym)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def role?(role)
    roles.include?(role)
  end

	#def assign_role
  #  	self.role = Role.find_by name: "Regular" if self.role.nil?
  #end
	#def editor?
	#	self.role.role_name == "editor"
	#end
	#def reader?
	#	self.role.role_name == "reader"
	#end

end
