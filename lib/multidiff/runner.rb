module Multidiff
  class Runner
    def self.invoke(args)
      data = read_files(args)

      abort 'Nothing to compare' if data.count < 2

      puts Multidiff::Differ.diff(data).map { |diff| diff.join("\n") }.join("\n\n")
    end

    class << self
      private

      def read_files(paths)
        paths.each_with_object([]) do |path, memo|
          pathname = Pathname.new(path)

          memo << pathname.read.split("\n") if pathname.file?
        end
      end
    end
  end
end
