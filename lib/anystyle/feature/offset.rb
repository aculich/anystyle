module Anystyle
  class Feature
    class Offset < Feature
      def elicit(offset:, sequence:)
        ((offset.to_f / sequence.length) * 10).round
      end
    end
  end
end