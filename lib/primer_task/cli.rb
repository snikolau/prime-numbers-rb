require 'thor'
require_relative '../primer_task'
# Commandline utility
module PrimerTask
  class Cli < Thor
    default_task :count
    package_name 'PrimerTask'
    option :count, type: :numeric, required: true
    desc 'count [number]', 'Prints a multiplication table of primes numbers.'
    def count
      PrimerTask::TablePrinter.new(
        PrimerTask::Presenter.new(
          PrimerTask.first(options[:count].to_i, PrimerTask::Generator.new)
        ).present(headers: true)
      ).print
    end

    def self.exit_on_failure?
      true
    end
  end
end
