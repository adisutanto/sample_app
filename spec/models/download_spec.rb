# == Schema Information
#
# Table name: downloads
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  filepath   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Download do
  let(:download) { FactoryGirl.create(:download) }

  subject { download }

  it { should respond_to(:name) }
  it { should respond_to(:filepath) }

  it { should be_valid }

  describe "when name is not present" do
    before { download.name = "" }
    it { should_not be_valid }
  end
  describe "when filepath is not present" do
    before { download.filepath = "" }
    it { should_not be_valid }
  end
end
