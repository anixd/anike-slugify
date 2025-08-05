# frozen_string_literal: true

require_relative "cyrillic"

module Anike
  module Slugify
    module Transliterator
      class Russian < Cyrillic
        APPROXIMATIONS = {
          "Й" => "I",
          "М" => "M",
          "Х" => "H",
          "Ц" => "Ts",
          "Ш" => "Sh",
          "Щ" => "Sch",
          "Ю" => "U",
          "Я" => "Ya",
          "й" => "i",
          "х" => "h",
          "ц" => "ts",
          "щ" => "sch",
          "ю" => "u"
        }.freeze
      end
    end
  end
end
