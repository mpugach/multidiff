require 'spec_helper'

describe Rdiff do
  it 'has a version number' do
    expect(Rdiff::Version::STRING).not_to be nil
  end
end
