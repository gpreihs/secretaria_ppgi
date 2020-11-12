 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/user_activities", type: :request do
  # UserActivity. As you add validations to UserActivity, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      UserActivity.create! valid_attributes
      get user_activities_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user_activity = UserActivity.create! valid_attributes
      get user_activity_url(user_activity)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_activity_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      user_activity = UserActivity.create! valid_attributes
      get edit_user_activity_url(user_activity)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new UserActivity" do
        expect {
          post user_activities_url, params: { user_activity: valid_attributes }
        }.to change(UserActivity, :count).by(1)
      end

      it "redirects to the created user_activity" do
        post user_activities_url, params: { user_activity: valid_attributes }
        expect(response).to redirect_to(user_activity_url(UserActivity.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new UserActivity" do
        expect {
          post user_activities_url, params: { user_activity: invalid_attributes }
        }.to change(UserActivity, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post user_activities_url, params: { user_activity: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested user_activity" do
        user_activity = UserActivity.create! valid_attributes
        patch user_activity_url(user_activity), params: { user_activity: new_attributes }
        user_activity.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the user_activity" do
        user_activity = UserActivity.create! valid_attributes
        patch user_activity_url(user_activity), params: { user_activity: new_attributes }
        user_activity.reload
        expect(response).to redirect_to(user_activity_url(user_activity))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        user_activity = UserActivity.create! valid_attributes
        patch user_activity_url(user_activity), params: { user_activity: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user_activity" do
      user_activity = UserActivity.create! valid_attributes
      expect {
        delete user_activity_url(user_activity)
      }.to change(UserActivity, :count).by(-1)
    end

    it "redirects to the user_activities list" do
      user_activity = UserActivity.create! valid_attributes
      delete user_activity_url(user_activity)
      expect(response).to redirect_to(user_activities_url)
    end
  end
end