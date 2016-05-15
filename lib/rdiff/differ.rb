module Rdiff
  class Differ
    def self.diff
      output = [
        '1 * Some|Another',
        '2 - Simple',
        '3 Text',
        '4 File',
        '5 + With',
        '6 + Additional',
        '7 + Lines'
      ].join("\n")

      puts output
    end
  end
end
