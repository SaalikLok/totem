require 'rails_helper'

describe Api::V1::WebsitesController, type: :controller do
  describe "GET#index" do
    let!(:website1) { create(:website) }
    let!(:website2) { create(:website) }
    let!(:website3) { create(:website) }

    it "returns website data" do
      get :index

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json; charset=utf-8")

      expect(returned_json[0]["title"]).to eq website1.title
      expect(returned_json[0]["url"]).to eq website1.url
    end

    it "lists multiple websites" do
      get :index
      returned_json = JSON.parse(response.body)
      expect(returned_json.length).to eq 3
    end
  end

  describe "GET#show" do
    xit "returns all the visits for a single website" do
    end
  end

  describe "POST#create" do
    xit "creates a new website" do
    end

    xit "returns website data" do
    end

    xit "fails to create website with too long a title" do
    end

    xit "fails to create a website without a valid url" do
    end
  end

  describe "DELETE#destroy" do
    xit "deletes website" do
    end

    xit "fails to delete website with bad params" do
    end
  end
end
