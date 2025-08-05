# frozen_string_literal: true

require "spec_helper"

describe Anike::Slugify::Transliterator::Latin do
  let(:t) { described_class.instance }
  it_behaves_like "a latin transliterator"
end
