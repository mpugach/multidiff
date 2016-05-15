require 'diff/lcs'

module Multidiff
  class Differ
    OVERRIDE_ACTION = Hash.new { |hash, key| hash[key] = key }.merge('!' => '*', '=' => ' ')

    def self.diff(files)
      base = files.shift

      files.map { |file| Diff::LCS.sdiff(base, file) }
    end

    def self.pretty_diff(files)
      diff(files).map do |changes|
        changes.each_with_index.map do |change, line|
          text = if change.action == '!'
                   "#{change.old_element}|#{change.new_element}"
                 else
                   change.old_element || change.new_element
                 end

          "#{line.next}\t#{OVERRIDE_ACTION[change.action]}\t#{text}"
        end
      end
    end
  end
end
