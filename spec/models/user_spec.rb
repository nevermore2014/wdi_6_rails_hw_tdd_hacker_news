require 'spec_helper'

describe User do
  describe 'association' do
    it { should have_many :posts}
    it { should have_many :comments}
  end

  describe 'validation' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

end
