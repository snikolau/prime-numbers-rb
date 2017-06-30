require_relative '../lib/primer_task/table_printer'
require 'stringio'

RSpec.describe PrimerTask::TablePrinter do
  let(:input) { [[2, 3], [5, 7]] }
  let(:output) { StringIO.new }
  let(:expectation) do
    <<-EOS
+---+---+
| 2 | 3 |
+---+---+
| 5 | 7 |
+---+---+
    EOS
  end
  subject { described_class.new(input, output) }
  it 'prints formatted table into defined output stream' do
    subject.print
    expect(output.string).to eq(expectation.strip)
  end
end
