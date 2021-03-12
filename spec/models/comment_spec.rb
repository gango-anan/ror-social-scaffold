require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#valid?' do
    it 'is valid if all the data is provided' do
      user = create(:user)
      post = Post.new(user: user, content: SecureRandom.hex(50).to_s)
      content = SecureRandom.hex(50).to_s
      comment = Comment.new(user: user, post: post, content: content )
      expect(comment).to be_valid
    end

    it 'is invalid if it has no user' do
      user = create(:user)
      post = Post.new(user: user, content: SecureRandom.hex(50).to_s)
      content = SecureRandom.hex(50).to_s
      comment = Comment.new(user: nil, post: post, content: content )
      expect(comment).not_to be_valid
    end

    it 'is invalid if it has no post' do
      user = create(:user)
      content = SecureRandom.hex(50).to_s
      comment = Comment.new(user: user, post: nil, content: content )
      expect(comment).not_to be_valid
    end

    it 'is invalid if it has no content' do
      user = create(:user)
      post = Post.new(user: user, content: SecureRandom.hex(50).to_s)
      comment = Comment.new(user: user, post: post, content: nil )
      expect(comment).not_to be_valid
    end

    it 'is invalid if content is more than 200 characters.' do
      user = create(:user)
      content = SecureRandom.hex(150).to_s
      post = Post.new(user: user, content: SecureRandom.hex(50).to_s)
      comment = Comment.new(user: user, post: post, content: content )
      expect(comment).not_to be_valid
    end
  end
end