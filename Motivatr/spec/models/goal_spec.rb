# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Goal, type: :model do
  it {should validate_presence_of(:body)}
  it {should validate_presence_of(:user)}

  it {should belong_to(:user)}
  it {should have_many(:comments)}
  it {should have_many(:commentors).through(:comments)}



end
