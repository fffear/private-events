# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  remember_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name)
#

class User < ApplicationRecord
  attr_accessor :remember_token
  validates :name, presence: true

  has_many :created_events, { class_name: :Event, foreign_key: :creator_id }
 
  has_many :event_attendances, { foreign_key: :attendee_id }
  has_many :attended_events, { through: :event_attendances, source: :attended_event }

  has_many :sent_invites, { class_name: :Invitation, foreign_key: :inviter_id }
  has_many :received_invites, { class_name: :Invitation, foreign_key: :invitee_id }
  has_many :received_event_invites, { through: :received_invites, source: :event }

  # Returns a random token.
  scope :new_token, -> { SecureRandom.urlsafe_base64 }

  # Return the hash digest of a given string
  scope :digest, ->(string) { BCrypt::Password.create(string) }

  # Previously attended events
  def previous_events
    self.attended_events.where("events.date < ?", Time.now)
  end

  # Upcoming events
  def upcoming_events
    self.attended_events.where("events.date > ?", Time.now)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
