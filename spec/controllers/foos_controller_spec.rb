require 'rails_helper'

RSpec.describe FoosController, type: :controller do

  let(:valid_attributes) { {bar: "foo"} }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all foos as @foos" do
      foo = Foo.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:foos)).to eq([foo])
    end
  end

end
