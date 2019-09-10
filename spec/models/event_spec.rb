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

require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
