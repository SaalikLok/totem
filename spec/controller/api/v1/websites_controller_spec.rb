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
    it "creates a new website" do
      post_json = {
        title: "A Website",
        url: "website.com"
      }

      prev_count = Website.count
      post(:create, params: post_json, format: :json)

      expect(response.status).to eq 200
      expect(Website.count).to eq(prev_count + 1)
    end

    it "returns website data" do
      post_json = {
        title: "A Website",
        url: "website.com"
      }

      post(:create, params: post_json, format: :json)
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(returned_json["title"]).to eq("A Website")
      expect(returned_json["url"]).to eq("website.com")
    end

    it "fails to create website with too long a title" do
      post_json = {
        title: "This is a website title and this is how big it is over",
        url: "website.com"
      }

      post(:create, params: post_json, format: :json)
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 422
      expect(returned_json["errors"]["title"][0]).to eq("Title is too long (maximum is 50 characters)")
    end

    it "fails to create a website without a valid url" do
      post_json = {
        title: "Website",
        url: ""
      }

      post(:create, params: post_json, format: :json)
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 422
      expect(returned_json["errors"]["url"][0]).to eq("Url can't be blank")
    end
  end

  describe "DELETE#destroy" do
    let!(:website) { create(:website) }

    it "deletes and returns website" do
      delete :destroy, params: { id: website.id }
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(returned_json["title"]).to eq(website.title)
      expect(returned_json["url"]).to eq(website.url)
    end

    xit "deletes all associated visits" do
    end
  end
end
