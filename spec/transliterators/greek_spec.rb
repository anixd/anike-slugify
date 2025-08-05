# frozen_string_literal: true

require "spec_helper"

describe Anike::Slugify::Transliterator::Greek do
  let(:t) { described_class.instance }
  it_behaves_like "a greek transliterator"

  it "should transliterate various characters" do
    examples = {
      "Γερμανία" => "Germania",
      "Αυστρία" => "Aystria",
      "Ιταλία" => "Italia"
    }
    examples.each { |k, v| expect(t.transliterate(k)).to eql(v) }
  end
end
