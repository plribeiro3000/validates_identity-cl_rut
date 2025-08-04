# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ValidatesIdentity::ClRut::Validator do
  it 'accepts 27402089-k' do
    expect(described_class.new('27402089-k')).to be_valid
  end

  it 'accepts 76086428-5' do
    expect(described_class.new('76086428-5')).to be_valid
  end

  it 'accepts 76.086.428-5' do
    expect(described_class.new('76.086.428-5')).to be_valid
  end

  it 'accepts 220604497' do
    expect(described_class.new('220604497')).to be_valid
  end

  it 'accepts 22060449-7' do
    expect(described_class.new('22060449-7')).to be_valid
  end

  it 'accepts 22.060.449-7' do
    expect(described_class.new('22.060.449-7')).to be_valid
  end

  it 'accepts 125319092' do
    expect(described_class.new('125319092')).to be_valid
  end

  it 'accepts 12531909-2' do
    expect(described_class.new('12531909-2')).to be_valid
  end

  it 'accepts 12.531.909-2' do
    expect(described_class.new('12.531.909-2')).to be_valid
  end

  it 'rejects 10601313494' do
    expect(described_class.new('10601313494')).not_to be_valid
  end

  it 'rejects 10754821235' do
    expect(described_class.new('10754821235')).not_to be_valid
  end

  it 'rejects 10186563129' do
    expect(described_class.new('10186563129')).not_to be_valid
  end

  it 'rejects 20601313491' do
    expect(described_class.new('20601313491')).not_to be_valid
  end

  it 'rejects 10-01-23-123' do
    expect(described_class.new('10-01-23-123')).not_to be_valid
  end

  it 'rejects AA-123-123' do
    expect(described_class.new('AA-123-123')).not_to be_valid
  end

  it 'rejects 1-1' do
    expect(described_class.new('1-1')).not_to be_valid
  end

  it 'rejects 0-12-12' do
    expect(described_class.new('0-12-12')).not_to be_valid
  end

  it 'rejects 1-0-1' do
    expect(described_class.new('1-0-1')).not_to be_valid
  end

  it 'rejects 1-0' do
    expect(described_class.new('1-0')).not_to be_valid
  end

  it 'rejects A' do
    expect(described_class.new('A')).not_to be_valid
  end

  it 'accepts blank string' do
    expect(described_class.new('')).to be_valid
  end

  it 'accepts nil' do
    expect(described_class.new(nil)).to be_valid
  end
end
