require 'rails_helper'
describe ItemsController do
  describe "GET #show" do
    it "特定のidでshowビューに遷移するか" do
      item = create(:item)
      get :show, params: { id: item }
      expect(response).to render_template :show
    end

    it "showアクションの中で定義されている@itemがitemとなっているか" do
      item = create(:item)
      get :show, params: { id: item }
      expect(assigns(:item)).to eq item
    end 

    it 'リクエスト200でokになるか' do
      expect(response).to have_http_status(:ok)
    end
  end 
end