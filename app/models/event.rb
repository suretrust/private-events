# frozen_string_literal: true

class Event < ApplicationRecord
  # Associations
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :attendees, class_name: 'User'

  # scopes
  scope :upcoming_events, -> { where("date > ?", Time.now) }
  scope :previous_events, -> { where("date < ?", Time.now) }

  # default scope
  default_scope { order(:date) }

  # validations
  validates :name, :address, :date, presence: true
end
