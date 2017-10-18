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
    @user = User.create(name: 'James', email: 'asd@mail.ru',
                        password: 'qwerty', password_confirmation: 'qwerty',
                        roles_mask: 1)
    @article = Article.create(title: 'title', text: 'text', user_id: @user.id)
    @comment = Comment.new(body: 'body', user_id: @user.id,
                           article_id: @article.id)
    expect(@comment).to be_valid
  end
end