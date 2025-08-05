# frozen_string_literal: true

require_relative "latin"

module Anike
  module Slugify
    module Transliterator
      class Serbian < Latin
        APPROXIMATIONS = Cyrillic.const_get(:APPROXIMATIONS).merge(
          {
            "Ð" => "Dj",
            "Č" => "Ch",
            "Š" => "Sh",
            "č" => "ch",
            "đ" => "dj",
            "š" => "sh",
            "Ћ" => "C",
            "Ц" => "C",
            "Ч" => "Ch",
            "Ђ" => "Dj",
            "Џ" => "Dz",
            "Х" => "H",
            "Ј" => "J",
            "Љ" => "Lj",
            "Њ" => "Nj",
            "ц" => "c",
            "ћ" => "c",
            "ч" => "ch",
            "ђ" => "dj",
            "џ" => "dz",
            "х" => "h",
            "ј" => "j",
            "љ" => "lj",
            "њ" => "nj"
          }
        )
      end
    end
  end
end
