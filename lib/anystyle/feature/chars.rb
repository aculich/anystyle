module AnyStyle
  class Feature
    class Chars < Feature
      attr_reader :precision

      def initialize(precision: 100)
        @precision = precision
      end

      def observe(token, page:, **opts)
        chars = count(token, /\p{L}/)
        upper = count(token, /\p{Lu}/)
        white = count(token, /\s/)
        punct = count(token, /[\p{Pd}:.,&\(\)"'”„’‚´«「『‘“`»」』]/)
        width = display_width(token)

        [
          chars,
          width,
          ratio(upper, chars),
          ratio(white, chars),
          ratio(punct, chars),
          ratio(width, page.width)
        ]
      end

      def ratio(x, y)
        (y > 0) ? ((x.to_f / y) * precision).round : 0
      end
    end
  end
end
