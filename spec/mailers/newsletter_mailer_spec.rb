require "spec_helper"

describe NewsletterMailer do
  describe "weekly" do
    let(:email) { "foo@bar.com" }
    let(:mail) { NewsletterMailer.weekly(email) }
    let(:subject) { "RailsCasts Weekly" }

    it "renders the headers" do
      mail.subject.should eq(subject)
      mail.to.should eq([email])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("RailsCasts")
    end
  end

end
