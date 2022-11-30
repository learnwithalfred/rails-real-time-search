require 'rails_helper'

RSpec.describe Article, type: :model do
   describe 'When testing Article model' do
    before(:each) do
      @article = FactoryBot.build(:article)
    end

    context 'When passing wrong parameters to the method' do
      it 'should not save the article no name' do
        @article.name = nil
        expect(@article).to_not be_valid
      end
    end

    context 'When passing valid parameters to the method' do
      it 'should save the article' do
        expect(@article).to be_valid
      end
    end

    context 'When testing edge cases with the method' do
      it "name should not exceed maximum length" do
        @article.name = "a" * (Article::MAX_LENGTH + 1)
        expect(@article).to_not be_valid
      end

      it "name should not be less tham minimum length" do
        @article.name = "a" * (Article::MIN_LENGTH - 1)
        expect(@article).to_not be_valid
      end
    end
  end
end
