require 'rails_helper'

describe GamesController, type: :controller do
  describe 'GET index' do
    it 'renders a 200' do
      response = get :index
      expect(response.status).to eq(200)
    end
  end
end