require 'spec_helper'

describe RubyJisho::Result do
  subject { RubyJisho::Result.new(response) }

  let(:response) { load_fixture(name: :result) }

  describe '#method_missing' do
    context 'with a valid key' do
      let(:expected) { [] }

      it 'returns the correct value' do
        expect(subject.tags).to eq(expected)
      end
    end

    context 'with an invalid key' do
      it 'raises an error' do
        expect { subject.crow }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#keys' do
    let(:expected) do
      [:is_common, :senses, :attribution, :japanese, :tags]
    end

    it 'returns an array of symbolized keys' do
      expect(subject.keys).to eq(expected)
    end
  end

  describe '#senses' do
    let(:sense_hash) do
      load_fixture(:sense_response)
    end

    it 'returns an array of Sense objects' do
      expect(subject.senses.first).to be_a(RubyJisho::Sense)
    end
  end

  describe '#is_common' do
    it 'returns a boolean of commonness' do
      expect(subject.is_common).to eq(false)
    end
  end

  describe '#to_h' do
    let(:to_h_results) do
      {
        attribution: {
          jmdict: true,
          jmnedict: false,
          dbpedia: false
        },
        is_common: false,
        japanese: [
          { word: '栗鼠', reading: 'りす' },
          { reading: 'リス' }
        ],
        senses: [sense, sense],
        tags: []
      }
    end
    let!(:sense) { RubyJisho::Sense.new({}) }

    before do
      allow(RubyJisho::Sense).to receive(:new).and_return(sense)
    end

    it 'builds to expected hash from Result methods' do
      expect(subject.to_h).to eq(to_h_results)
    end
  end

  describe '#japanese' do
    let(:expected) do
      {
        word: '栗鼠',
        reading: 'りす'
      }
    end

    it 'returns a boolean of commonness' do
      expect(subject.japanese.first).to eq(expected)
    end
  end

  describe '#tags' do
    it 'returns an array of tags' do
      expect(subject.tags).to eq([])
    end
  end
end
