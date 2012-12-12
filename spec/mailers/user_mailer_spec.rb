require "spec_helper"

describe UserMailer do

  describe "registration confirmation" do
    let(:user) { FactoryGirl.create(:user) }
    let(:mail) { UserMailer.registration_confirmation(user) }

    it "render the headers" do
      mail.subject.should eq("Registered")
      mail.to.should eq([user.email])
      mail.from.should eq(["ryan@railscasts.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Thank you")
    end
  end
end
