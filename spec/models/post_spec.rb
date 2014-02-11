require 'spec_helper'

describe Post do
  describe 'association' do
    it { should belong_to :user }
  end
end

