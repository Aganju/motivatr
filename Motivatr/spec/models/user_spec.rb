require 'rails_helper'

RSpec.describe User, type: :model do


  let!(:test_user) {User.create(username: 'bob', password: 'bobspass')}

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password) }

  it { should have_many(:comments)}
  it { should have_many(:goals)}

end
