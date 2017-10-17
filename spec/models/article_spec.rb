require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'should have an User to be created' do
    @article = Article.new(user_id: nil)
    expect(@article).not_to be_valid
  end
  it 'should be valid with valid parameters' do
    @user = User.create(name: 'James', email: 'asd@mail.ru',
                        password: 'qwerty', password_confirmation: 'qwerty',
                        roles_mask: 1)
    @article = Article.new(title: 'Title', text: 'Text', user_id: @user.id)
    expect(@article).to be_valid
  end
end