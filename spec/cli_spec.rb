require_relative '../lib/primer_task/cli'

RSpec.describe PrimerTask::Cli do
  let(:args) { [] }
  subject { described_class.start(args) }

  context 'when no arguments are provided' do
    let(:expected_output) { "No value provided for required options '--count'\n" }

    it 'outputs valid help text and exits' do
      expect {
        begin
          subject
        rescue SystemExit
        end
      }.to output(expected_output).to_stderr

      allow($stderr).to receive(:puts)
      expect { subject }.to raise_exception SystemExit
    end
  end

  context 'when help is requested' do
    let(:args) { %w{help} }
    let(:expected_output) do
      <<-EOS
PrimerTask commands:
  rspec count [number] --count=N  # Prints a multiplication table of primes numbers.
  rspec help [COMMAND]            # Describe available commands or one specific command

      EOS
    end

    it 'outputs valid help text' do
      expect { subject }.to output(expected_output).to_stdout
    end
  end

  context 'when count argument is set' do
    let(:args) { %w{--count 4} }
    let(:expected_output) do
      <<-EOS
+---+----+----+----+----+
|   | 2  | 3  | 5  | 7  |
+---+----+----+----+----+
| 2 | 4  | 6  | 10 | 14 |
| 3 | 6  | 9  | 15 | 21 |
| 5 | 10 | 15 | 25 | 35 |
| 7 | 14 | 21 | 35 | 49 |
+---+----+----+----+----+
      EOS
    end
    it 'outputs table with numbers' do
      expect { subject }.to output(expected_output.strip).to_stdout_from_any_process
    end
  end

  context 'when input is invalid' do
    let(:args) { %w{--count A} }
    let(:expected_output) { "Expected numeric value for '--count'; got \"A\"\n" }
    it 'outputs error with description and exits' do
      expect {
        begin
         subject
        rescue SystemExit
        end
      }.to output(expected_output).to_stderr
      allow($stderr).to receive(:puts)
      expect { subject }.to raise_exception SystemExit
    end
  end
end
