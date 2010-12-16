require 'spec_helper'

describe Survey do
  describe '#create' do
    before {@survey = Survey.create(:question => 'Test')}
    it 'should have a shortened url' do
      @survey.shortened_url.should_not be_nil
    end
  end
end
