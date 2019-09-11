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

require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "validates presence of name" do
    user = FactoryBot.build(:user, name: "")
    expect(user).to_not be_valid
  end
  
  describe 'assocations' do
    it 'expect user#created_events to return event objects created by user' do
      user = FactoryBot.create(:user)
      event = user.created_events.create(date: 2.days.from_now,
                                         title: "Test Title",
                                         description: "Test description")
      expect(user.created_events.count).to eq(1)
      expect(user.created_events[0].class).to be(Event)
      expect(user.created_events[0].creator_id).to be(user.id)
    end
  end
end
