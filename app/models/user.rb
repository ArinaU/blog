# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :articles

  belongs_to :role

  def assign_role
    self.role = Role.find_by name: 'Regular' if role.nil?
  end

  def editor?
    role.role_name == 'editor'
  end

  def reader?
    role.role_name == 'reader'
  end
end
