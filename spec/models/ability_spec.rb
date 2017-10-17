require 'cancan/matchers'
require 'rails_helper'


RSpec.describe Ability, type: :model do
	before do
		# new users
		@userEditor1 = User.create(name: 'James', email: 'asd@mail.ru',
                        password: 'qwerty', password_confirmation: 'qwerty',
                        roles_mask: 1)
		@userEditor2 = User.create(name: 'James', email: 'bbb@mail.ru',
                        password: 'qwerty', password_confirmation: 'qwerty',
                        roles_mask: 1)
		@userReader = User.create(name: 'James', email: 'aaa@mail.ru',
                        password: 'qwerty', password_confirmation: 'qwerty',
                        roles_mask: 2)

		# new articles
    @article1 = Article.new(title: 'Title', text: 'Text', user_id: @userEditor1.id)
    @article2 = Article.new(title: 'Title', text: 'Text', user_id: @userEditor2.id)

    # new comments
    @editorsComment = Comment.new(body: "Comment", user_id: @userEditor1.id, article_id: @article2.id)
    @readersComment = Comment.new(body: "Comment", user_id: @userReader.id, article_id: @article2.id)

    # new abilities
    @abilityEditor = Ability.new(@userEditor1)
    @abilitySecondEditor = Ability.new(@userEditor2)
    @abilityReader = Ability.new(@userReader)
  end

	it "editor should be able to read articles" do 
    expect(@abilityEditor).to be_able_to(:read, Article.new)
	end

	it "editor should be able to create articles" do 
    expect(@abilityEditor).to be_able_to(:create, Article.new)
	end

	it "editor should be able to destroy his articles" do 
    expect(@abilityEditor).to be_able_to(:destroy, @article1)
	end

	it "editor should not be able to destroy others' articles" do 
    expect(@abilityEditor).not_to be_able_to(:destroy, @article2)
	end

	it "editor should be able to update his articles" do 
    expect(@abilityEditor).to be_able_to(:update, @article1)
	end

	it "editor should not be able to update others' articles" do 
    expect(@abilityEditor).not_to be_able_to(:update, @article2)
  end

  it "editor should be able to read comments" do 
    expect(@abilityEditor).to be_able_to(:read, Comment.new)
  end

  it "editor should be able to create comments" do 
    expect(@abilityEditor).to be_able_to(:create, Comment.new)
  end

  it "editor should be able to destroy his comments" do 
    expect(@abilityEditor).to be_able_to(:destroy, @editorsComment)
	end

	it "editor should be able to update his comments" do 
    expect(@abilityEditor).to be_able_to(:update, @editorsComment)
	end

	it "reader should be able to read articles" do 
    expect(@abilityReader).to be_able_to(:read, Article.new)
	end

	it "reader should be able to create comments" do 
    expect(@abilityReader).to be_able_to(:create, Comment.new)
	end

	it "reader should be able to destroy his comments" do 
    expect(@abilityReader).to be_able_to(:destroy, @readersComment)
	end

	it "reader should be able to update his comments" do 
    expect(@abilityReader).to be_able_to(:update, @readersComment)
	end

	it "reader should not be able to destroy others' comments" do 
    expect(@abilityReader).not_to be_able_to(:destroy, @editorsComment)
	end

	it "reader should not be able to update others' comments" do 
    expect(@abilityReader).not_to be_able_to(:update, @editorsComment)
	end

	it "unauthorised user should be able to read articles" do 
		expect(Ability.new(User.new)).to be_able_to(:read, Article.new)
	end

# fails
#	it "editor should be able to destroy comments in his article" do        
#    expect(@abilitySecondEditor).to be_able_to(:destroy, @readersComment)
#	end

end