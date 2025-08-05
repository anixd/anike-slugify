# frozen_string_literal: true

require "spec_helper"

describe "Anike-specific features" do
  describe "apostrophe handling" do
    it "should replace all types of apostrophes with dashes" do
      examples = {
        "t'elu" => "t-elu",           # ASCII apostrophe
        "t’elu" => "t-elu",           # Right single quote
        "t‘elu" => "t-elu",           # Left single quote
        "t`elu" => "t-elu",           # Grave accent
        "t´elu" => "t-elu",           # Acute accent
        "tʼelu" => "t-elu"            # Modifier apostrophe
      }

      examples.each do |input, expected|
        result = input.to_anike_slug.normalize
        expect(result.to_s).to eq(expected)
      end
    end
  end

  describe "affix preservation" do
    it "should preserve leading dashes by default" do
      result = "-ri".to_anike_slug.normalize
      expect(result.to_s).to eq("-ri")
    end

    it "should preserve trailing dashes by default" do
      result = "an-".to_anike_slug.normalize
      expect(result.to_s).to eq("an-")
    end

    it "should remove leading dashes when preserve_affixes is false" do
      result = "-ri".to_anike_slug.normalize(preserve_affixes: false)
      expect(result.to_s).to eq("ri")
    end

    it "should remove trailing dashes when preserve_affixes is false" do
      result = "an-".to_anike_slug.normalize(preserve_affixes: false)
      expect(result.to_s).to eq("an")
    end

    it "should allow fine-grained control" do
      # Сохранить только leading
      result = "-test-".to_anike_slug.normalize(preserve_leading_dashes: true, preserve_trailing_dashes: false)
      expect(result.to_s).to eq("-test")

      # Сохранить только trailing
      result = "-test-".to_anike_slug.normalize(preserve_leading_dashes: false, preserve_trailing_dashes: true)
      expect(result.to_s).to eq("test-")
    end
  end
end
