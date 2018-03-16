require "rails_helper"

RSpec.describe ZernikesController, :type => :controller do
#   it "receives a json file" do
#       expect(coefficients_extractor).to receive
#   it "assigns "
    it "renders the upload template" do
      get :upload
      expect(response).to render_template("upload")
    end
    it "renders the main template" do
      get :main
      expect(response).to render_template("main")
    end
    it "renders the random template" do
      get :random
      expect(response).to redirect_to(root_path)
    end
    
end