require 'rails_helper'

RSpec.describe Search, type: :model do
  describe 'When testing Article model' do
    before(:each) do
      @search = FactoryBot.build(:search)
    end

    context 'When passing wrong parameters to the method' do
      it 'should not save the search no ip_address' do
        @search.ip_address = nil
        expect(@search).to_not be_valid
      end

      it 'should not save the search no query' do
        @search.query = nil
        expect(@search).to_not be_valid
      end
    end

    context 'When passing valid parameters to the method' do
      it 'should save the search' do
        expect(@search).to be_valid
      end
    end

    context 'When testing edge cases with the method' do
      it 'ip_address cannot exceed max length' do
        @search.ip_address = 'a' * (Search::MAX_IP_LENGTH + 1)
        expect(@search).to_not be_valid
      end

      it 'ip_address must be greater than 9' do
        @search.ip_address = 'a' * (Search::MIN_IP_LENGTH - 1)
        expect(@search).to_not be_valid
      end

      it 'query cannot exceed max length' do
        @search.query = 'a' * (Search::MAX_LENGTH + 1)
        expect(@search).to_not be_valid
      end
    end
  end
end
