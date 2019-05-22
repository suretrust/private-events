# frozen_string_literal: true
class User < ApplicationRecord
  # Associations
  has_many :events
  has_and_belongs_to_many :upcoming_events, class_name: 'Event'

  # Validations
  validates :name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 6 }
  
  has_secure_password
end
