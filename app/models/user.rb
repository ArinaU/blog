class User < ApplicationRecord

	has_many :comments
	has_many :articles

	belongs_to :role

	def editor?
		self.role.role_name == "editor"
	end

	def reader?
		self.role.role_name == "reader"
	end

end
