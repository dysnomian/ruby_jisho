# frozen_string_literal: true

require 'spec_helper'

describe RubyJisho::Sense do
  subject { RubyJisho::Sense.new(response) }

  let(:response) { load_fixture(name: :sense_response) }

  describe '#parts_of_speech' do
    it 'returns an array of symbols' do
      expect(subject.parts_of_speech).to eq([:noun])
    end
  end

  describe '#to_h' do
    it 'returns the response hash' do
      expect(subject.to_h).to eq(response)
    end
  end

  describe '#keys' do
    let(:key_array) do
      [:links, :english_definitions, :see_also, :info, :tags,
       :antonyms, :parts_of_speech, :restrictions, :source]
    end

    it 'returns an array of key names' do
      expect(subject.keys).to eq(key_array)
    end
  end

  describe '#method_missing' do
    context 'with a valid key' do
      let(:expected) { ['Usually written using kana alone'] }

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
end
