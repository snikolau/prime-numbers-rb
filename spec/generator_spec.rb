require_relative '../lib/primer_task/generator'
require 'prime'

RSpec.describe PrimerTask::Generator do
  it 'returns first 10 prime numbers array' do
    expect(subject.first(10)).to eq Prime.first(10)
  end
end
