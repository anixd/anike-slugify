# frozen_string_literal: true

module Anike
  module Slugify
  end
end

class String
  def to_anike_slug
    Anike::Slugify::Identifier.new self
  end
  alias_method :to_slug, :to_anike_slug
end

require "anike/slugify/version"
require "anike/slugify/transliterator/base"
require "anike/slugify/identifier"
