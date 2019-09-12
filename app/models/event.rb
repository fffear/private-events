# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  date        :datetime         not null
#  description :text             not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  creator_id  :integer          not null
#
# Indexes
#
#  index_events_on_creator_id  (creator_id)
#  index_events_on_title       (title)
#

class Event < ApplicationRecord
  validates :date, :title, :description, presence: true

  belongs_to :creator, { class_name: :User, foreign_key: :creator_id }
  has_many :event_attendances, { foreign_key: :attended_event_id }
  has_many :attendees, { through: :event_attendances, source: :attendee }

  has_many :invitations
  has_many :invited_guests, { through: :invitations, source: :invitee }
  has_many :inviters, { through: :invitations, source: :inviter }

  scope :past, -> { where("date < ?", Time.now) }
  scope :upcoming, -> { where("date > ?", Time.now) }

  after_create :creator_attend_event

  private
    def creator_attend_event
      self.event_attendances.create(attended_event_id: self.id,
                                    attendee_id:       self.creator_id)
    end
end
