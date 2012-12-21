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

class Download < ActiveRecord::Base
  attr_accessible :filepath, :name

  validates :name, presence: true
  validates :filepath, presence: true
end
