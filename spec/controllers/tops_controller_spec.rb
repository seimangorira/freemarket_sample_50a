require 'rails_helper'
describe TopsController do

  describe 'GET #index' do
    it '出品したアイテムの表示が最新のid順になっているか' do
      items = create_list(:item, 4)
      get :index
      expect(assigns(:ladyitems)).to match(items.sort{|a, b| b.id <=> a.id})
    end

    it 'tops/index.html.hamlページに遷移されるか' do
      get :index
      expect(response).to render_template :index
    end

    it 'リクエスト200でokになるか' do
      expect(response).to have_http_status(:ok)
    end
  end
end