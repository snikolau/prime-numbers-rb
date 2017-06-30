require_relative '../lib/primer_task/presenter'

RSpec.describe PrimerTask::Presenter do
  let(:sample){ [2, 3, 5] }

  subject { PrimerTask::Presenter.new(sample) }
  it 'produces 2d array with product of array multiplication' do
    expect(subject.present).to eq [[4,  6,  10],
                                   [6,  9,  15],
                                   [10, 15, 25]]
  end

  it 'produces 2d array with product of array multiplication and headers' do
    expect(subject.present(headers: true, corner: 'x')).to eq [['x', 2, 3, 5],
                                                               [2, 4,  6,  10],
                                                               [3, 6,  9,  15],
                                                               [5, 10, 15, 25]]
  end
end
