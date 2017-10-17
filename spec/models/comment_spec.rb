require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should have an Article to be created' do
    comment = Comment.new(article_id: nil)
    expect(comment).not_to be_valid
  end
  it 'should have an User to be created' do
    comment = Comment.new(user_id: nil)
    expect(comment).not_to be_valid
  end
  it 'should be valid with valid parameters' do
    comment = Comment.new(body: 'BODYA', user_id: 5, article_id: 2)
    expect(comment).to be_valid
  end
end