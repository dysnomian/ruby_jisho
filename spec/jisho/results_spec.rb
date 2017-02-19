require 'spec_helper'

describe Jisho::Results do
  subject { Jisho::Results.new(payload) }

  let(:payload) { load_fixture(name: :squirrel, parse: false) }
  let!(:result) { Jisho::Result.new({}) }

  before { allow(Jisho::Result).to receive(:new).and_return(result) }

  describe '#meta' do
    it 'returns a hash of the meta content' do
      expect(subject.meta).to eq(status: 200)
    end
  end

  describe '#first' do
    it 'returns the expected Result object' do
      expect(subject.first).to eq(result)
    end
  end
end
