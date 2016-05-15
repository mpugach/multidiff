require 'spec_helper'
require 'support/helper_methods'

describe Rdiff::Runner do
  describe 'should print diff' do
    let(:first_v_second) do
      [
        "1\t*\tSome|Another",
        "2\t-\tSimple",
        "3\t \tText",
        "4\t \tFile",
        "5\t+\tWith",
        "6\t+\tAdditional",
        "7\t+\tLines",
        ''
      ].join("\n")
    end

    let(:first_v_third) do
      [
        "1\t*\tSome|Ololo",
        "2\t+\tWith",
        "3\t+\tAdditional",
        "4\t+\tLines",
        "5\t \tSimple",
        "6\t \tText",
        "7\t-\tFile",
        ''
      ].join("\n")
    end

    it 'first vs second' do
      args = %w(spec/fixtures/first.txt spec/fixtures/second.txt)
      printed = capture_stdout { described_class.invoke(args) }

      expect(printed).to eq(first_v_second)
    end

    it 'first vs third' do
      args = %w(spec/fixtures/first.txt spec/fixtures/third.txt)
      printed = capture_stdout { described_class.invoke(args) }

      expect(printed).to eq(first_v_third)
    end

    it 'first vs second and vs third' do
      args = %w(spec/fixtures/first.txt spec/fixtures/second.txt spec/fixtures/third.txt)
      printed = capture_stdout { described_class.invoke(args) }

      expect(printed).to eq("#{first_v_second}\n#{first_v_third}")
    end
  end

  describe 'should not compare' do
    shared_examples 'expect warning message' do
      it 'exits with 1' do
        begin
          old = $stderr
          $stderr = StringIO.new

          described_class.invoke(args)
        rescue SystemExit => e
          expect(e.status).to eq(1)
          expect(e.message).to eq('Nothing to compare')
        ensure
          $stderr = old
        end
      end
    end

    context 'only one file provided' do
      let(:args) { %w(spec/fixtures/first.txt) }

      include_examples 'expect warning message'
    end

    context 'nothing provided' do
      let(:args) { [] }

      include_examples 'expect warning message'
    end

    context 'fake provided' do
      let(:args) { %w(ololo) }

      include_examples 'expect warning message'
    end

    context 'fake and one file provided' do
      let(:args) { %w(spec/fixtures/first.txt ololo) }

      include_examples 'expect warning message'
    end
  end
end
