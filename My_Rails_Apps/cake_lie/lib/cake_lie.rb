require "cake_lie/version"

module CakeLie
  class Frosting
    COLORS = ['green', 'blue', 'red', 'yellow', 'brown']
    CAKES = ['shortcake', 'poundcake', 'pineapple upside down cake', 'urinal cake']

    def spatula
      CAKES.sample
    end

    def cake_with_color
      "A #{COLORS.sample} #{CAKES.sample}"
    end

  end
end