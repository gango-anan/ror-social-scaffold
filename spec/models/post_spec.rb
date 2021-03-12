require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#valid?' do
    it 'is valid if it has a user' do
      user = create(:user)
      post = Post.new(user: user, content: SecureRandom.hex(50).to_s)
      expect(post).to be_valid
    end

    it 'is invalid if it has no user' do
      post = Post.new(user: nil, content: SecureRandom.hex(50).to_s)
      expect(post).not_to be_valid
    end
  end
end
