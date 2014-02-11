require 'spec_helper'

describe Comment do
  describe 'association' do
    it { should belong_to :post }
    it { should belong_to :user }
  end
end
