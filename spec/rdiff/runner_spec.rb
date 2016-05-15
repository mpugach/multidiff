require 'spec_helper'
require 'support/helper_methods'

describe Rdiff::Runner do
  it 'should print diff' do
    args = %w(spec/fixtures/first.txt spec/fixtures/second.txt)
    printed = capture_stdout { described_class.invoke(args) }
    expected = [
      '1 * Some|Another',
      '2 - Simple',
      '3 Text',
      '4 File',
      '5 + With',
      '6 + Additional',
      '7 + Lines',
      '',
      ''
    ].join("\n")

    expect(printed).to eq(expected)
  end
end
