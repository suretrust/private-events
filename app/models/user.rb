# frozen_string_literal: true

class User < ApplicationRecord
  # Associations
  has_many :events
  has_and_belongs_to_many :enrolled_events, class_name: 'Event'
  
  # Validations
  validates :name, :email, presence: true
  validates :password, length: { minimum: 6 }
  validates :enrolled_events, uniqueness: true

  has_secure_password
end
