require 'spec_helper'
require 'json'

describe RubyJisho do
  describe '.search' do
    let(:query) { 'squirrel' }

    let(:mock_search) do
      m = Struct.new(:results)
      m.new(results)
    end

    let(:results) { RubyJisho::Results.new('{}') }

    before do
      allow(RubyJisho::Search).to receive(:new).with(query)
        .and_return(mock_search)
    end

    it 'creates a new Search and returns the results' do
      expect(subject.search(query)).to eq(results)
    end
  end
end
