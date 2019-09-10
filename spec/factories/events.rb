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

FactoryBot.define do
  factory :event do
    
  end
end
