require 'rails_helper'

RSpec.describe "Doc_request", type: :request do
  describe "GET /doc_request" do
    it "requests" do
      get doc_request_path
      expect(response).to have_http_status(200)
    end
  end
end

# RSpec.describe "Request Documentation", type: :request do
#   before (:each) do
#     @professor = User.new(email: 'professor@professor.com', password: 'admin123')
#     @professor.add_role(:coordinator)
#     @professor.save!
#     sign_in @professor


#   end

#   describe "NEW /request/new" do
#     it "create request" do
#       get new_request_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end

