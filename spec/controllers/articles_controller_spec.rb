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
    sign_in @user
  end


   describe 'POST#create' do

    it 'creates a new article' do

      expect {
        post :create, params:{ article: { title: "title1", text: "text1" } }
      }.to change(Article, :count).by(1)

      expect(response).to redirect_to article_path(assigns[:article])
    end
  end


  describe 'GET index' do
    it 'renders index and comments count next to article' do
      get :index
      expect(response).to render_template('index')
      expect(@article.comments.count).to eq(2)
    end
  end


  describe 'GET#show' do
    before { get :show, params: { id: @article.id } }

    it 'assigns the requested article to the @article' do
      expect(assigns(:article)).to eq(@article)
    end

    it 'assigns user of the current article to @user' do
      expect(assigns(:user)).to eq(@article.user)
    end
  end

end

