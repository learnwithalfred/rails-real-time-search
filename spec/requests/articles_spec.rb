require 'rails_helper'

RSpec.describe '/articles', type: :request do
  before(:each) do
    @article = FactoryBot.create(:article)
  end
  describe 'GET /index' do
    before(:each) do
      get articles_url
    end
    it 'renders a successful response' do
      get articles_url
      expect(response).to be_successful
    end

    it 'should render correct template' do
      expect(response).to render_template(:index)
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include('Articles')
    end
  end

  describe 'GET /show' do
    before(:each) do
      get article_url(@article)
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'should render correct template' do
      expect(response).to render_template(:show)
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include @article.name
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_article_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      article = FactoryBot.create(:article)
      get edit_article_url(article)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Article' do
        expect do
          post articles_url, params: { article: { name: 'my first article' } }
        end.to change(Article, :count).by(1)
      end

      it 'redirects to the created article' do
        post articles_url, params: { article: { name: 'my first article' } }
        expect(response).to redirect_to(article_url(Article.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Article' do
        expect do
          post articles_url, params: { article: { name: '' } }
        end.to change(Article, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post articles_url, params: { article: { name: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'redirects to the article' do
        patch article_url(@article), params: { article: { name: 'Updated article' } }
        expect(response).to redirect_to(article_url(@article))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch article_url(@article), params: { article: { name: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested article' do
      expect do
        delete article_url(@article)
      end.to change(Article, :count).by(-1)
    end

    it 'redirects to the articles list' do
      delete article_url(@article)
      expect(response).to redirect_to(articles_url)
    end
  end
end
