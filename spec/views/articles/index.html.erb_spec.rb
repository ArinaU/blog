require 'rails_helper'

describe 'articles/index' do
  before(:each) do
    @user = User.create(name: 'James', email: 'asd@mail.ru',
                        password: 'qwerty', password_confirmation: 'qwerty',
                        roles_mask: 1)
    @article1 = Article.create(title: 'title', text: 'text', user_id: @user.id)
    @article2 = Article.create(title: 'mzx', text: 'mkx', user_id: @user.id)
    @comment1 = Comment.create(body: 'body', user_id: @user.id,
                               article_id: @article1.id)
    @comment2 = Comment.create(body: 'body2', user_id: @user.id,
                               article_id: @article1.id)
  end
  it 'displays last 10 articles' do
    assign(:articles, [@article1, @article2])

    render

    expect(rendered).to match /mkx/
  end
end