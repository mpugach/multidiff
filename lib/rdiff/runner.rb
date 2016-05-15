module Rdiff
  class Runner
    def self.invoke(_args)
      puts Rdiff::Differ.diff
    end
  end
end
