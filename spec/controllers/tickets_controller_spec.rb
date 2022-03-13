require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe "a non-logged in person" do
    it "redirects to dashboard" do
      get :show, params: {id: 'FAKE'}
      expect(response).to redirect_to(dashboard_path)
      get :close, params: {id: 'FAKE'}
      expect(response).to redirect_to(dashboard_path)
      post :capture, params: {id: 'FAKE'}
      expect(response).to redirect_to(dashboard_path)
      post :release, params: {id: 'FAKE'}
      expect(response).to redirect_to(dashboard_path)
      post :destroy, params: {id: 'FAKE'}
      expect(response).to redirect_to(dashboard_path)
    end
  end

  describe "a logged-in user with an organization" do
    let(:user) { create(:user) }
    let(:organization) { create(:organization) }

    before do
      user.organization = organization
      user.confirm
      sign_in(user)
      user.organization.approve
    end

    it "redirects to dashboard_path" do
      delete :destroy, params: {id: 'FAKE'}
      expect(response).to redirect_to(dashboard_path)
    end
  end
end
