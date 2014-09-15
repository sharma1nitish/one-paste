# == Schema Information
#
# Table name: pastes
#
#  id         :integer          not null, primary key
#  content    :text
#  token      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Paste < ActiveRecord::Base

  before_create :allot_token

  validates_uniqueness_of :token
  validates_presence_of :content
  
  private

  def allot_token
    self.token = SecureRandom.urlsafe_base64
  end  
end
