require 'rails_helper'

RSpec.describe ArticlesController do

  before(:each) do
    @user = User.create(name: 'James', email: 'asd@mail.ru',
                        password: 'qwerty', password_confirmation: 'qwerty',
                        roles_mask: 1)
    @article = Article.create(title: 'title', text: 'text', user_id: @user.id)
    @comment1 = Comment.create(body: 'body', user_id: @user.id,
                               article_id: @article.id)
    @comment2 = Comment.create(body: 'body2', user_id: @user.id,
                               article_id: @article.id)
  end
  describe 'GET index' do
    it 'renders index and comments count next to article' do
      get :index
      expect(response).to render_template('index')
      expect(@article.comments.count).to eq(2)
    end
  end
end
