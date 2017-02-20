require 'spec_helper'

describe RubyJisho::Search do
  subject { RubyJisho::Search.new(query) }

  let(:query) { 'squirrel' }
  let(:url)   { "http://jisho.org/api/v1/search/words?keyword=#{query}" }
  let(:json)  { load_fixture(name: query, parse: false) }

  let(:faraday_mock) do
    f = Struct.new(:body)
    f.new(json)
  end

  let(:results) { RubyJisho::Results.new(json) }

  before do
    allow(Faraday).to receive(:get)
      .with("http://jisho.org/api/v1/search/words?keyword=#{query}")
      .and_return(faraday_mock)

    allow(RubyJisho::Results).to receive(:new)
      .with(json).and_return(results)
  end

  describe '#results' do
    context 'with an English query' do
      let(:query) { 'squirrel' }

      it 'returns a Results object' do
        expect(subject.results).to eq(results)
      end
    end

    context 'with a Japanese query' do
      let(:query) { '栗鼠' }

      it 'returns a Results object' do
        expect(subject.results).to eq(results)
      end
    end
  end
end
