# frozen_string_literal: true

require "spec_helper"

describe Anike::Slugify::Transliterator::Base do
  let(:t) { Anike::Slugify::Transliterator::Base.instance }

  it "should transliterate quotes and apostrophes to dashes" do
    expect(t.transliterate("'")).to eql("-")  # right single quote
    expect(t.transliterate("'")).to eql("-")  # left single quote
    expect(t.transliterate('"')).to eql('"')  # double quotes остаются как есть
    expect(t.transliterate('"')).to eql('"')  # (их уберёт normalize)
  end

  it "should transliterate non-breaking spaces" do
    expect(t.transliterate("\xc2\xa0")).to eql(" ")
  end
end
