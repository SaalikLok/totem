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
    xit "creates a new visit" do
    end

    xit "returns visit data on success" do
    end

    xit "fails to create a new visit with bad params" do
    end

    xit "fails to create a new visit with an incorrect website" do
    end
  end
end
