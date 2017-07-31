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

class Goal < ApplicationRecord
  validates :body, :user, :private, presence: true

  belongs_to :user
  has_many :comments

  has_many :commentors,
    through: :comments,
    source: :user
end
