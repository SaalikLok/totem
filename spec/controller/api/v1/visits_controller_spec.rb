require "rails_helper"

describe Api::V1::VisitsController, type: :controller do
  let!(:website) { create(:website) }
  let!(:visit) { create(:visit) }

  describe "GET#show" do
    it "returns data for a visit" do
      get :show, params: { id: visit.id }

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json; charset=utf-8")

      expect(returned_json["full_url"]).to eq visit.full_url
      expect(returned_json["host"]).to eq visit.host
      expect(returned_json["pathname"]).to eq visit.pathname
      expect(returned_json["referring_host"]).to eq visit.referring_host
    end
  end

  describe "POST#create" do
    it "creates a new visit" do
      post_json = {
        full_url: 'https://mysite.com/dashboard',
        host: website.url,
        pathname: '/dashboard',
        referring_host: 'google.com',
      }

      prev_count = Visit.count
      post(:create, params: post_json, format: :json)

      expect(response.status).to eq 200
      expect(Visit.count).to eq(prev_count + 1)
    end

    it "returns visit data on success" do
      post_json = {
        full_url: 'https://mysite.com/dashboard',
        host: website.url,
        pathname: '/dashboard',
        referring_host: 'google.com',
      }

      post(:create, params: post_json, format: :json)
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(returned_json["full_url"]).to eq("https://mysite.com/dashboard")
      expect(returned_json["host"]).to eq("mysite.com")
      expect(returned_json["pathname"]).to eq("/dashboard")
      expect(returned_json["referring_host"]).to eq("google.com")
    end

    it "fails to create a new visit with bad params" do
      post_json = {
        full_url: 'NOTHING'
      }

      post(:create, params: post_json, format: :json)
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 422
      expect(returned_json["errors"]).not_to be_empty
    end

    it "fails to create a new visit with an unregistered website host" do
      post_json = {
        full_url: 'https://something.com/dashboard',
        host: 'something.com',
        pathname: '/dashboard',
        referring_host: 'google.com',
      }

      post(:create, params: post_json, format: :json)
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 422
      expect(returned_json["errors"]["website"][0]).to eq("Website must exist")
    end
  end
end
