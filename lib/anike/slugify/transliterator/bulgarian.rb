# frozen_string_literal: true

require_relative "cyrillic"

module Anike
  module Slugify
    module Transliterator
      class Bulgarian < Cyrillic
        APPROXIMATIONS = {
          "Ж" => "J",
          "Й" => "I",
          "Х" => "H",
          "Ц" => "C",
          "Щ" => "Sht",
          "Ъ" => "U",
          "Ь" => "I",
          "Ю" => "Iu",
          "Я" => "Ia",
          "ж" => "j",
          "й" => "i",
          "х" => "h",
          "ц" => "c",
          "щ" => "sht",
          "ъ" => "u",
          "ь" => "i",
          "ю" => "iu",
          "я" => "ia"
        }.freeze
      end
    end
  end
end
