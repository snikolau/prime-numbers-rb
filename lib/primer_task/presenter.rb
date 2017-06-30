module PrimerTask
  # Class responsible for converting 1 dimensional array to
  # 2D array.
  class Presenter
    # @params [Array] data
    def initialize(data)
      @data = data
    end

    # Generate 2-dimensional array
    #
    # :opts: can be set to
    # <tt>headers: true | false </tt> Define if generated table should
    # have headers. Default false.
    # <tt>corner: any character | nil </tt> Set how should be filled
    # empty corner in case of header generation. Default is nil.
    def present(opts = {})
      headers = opts.fetch(:headers) { false }
      if headers
        generate_with_headers(opts)
      else
        generate_raw
      end
    end

    private

    def generate_raw
      @raw_array ||= @data.product(@data).map do |elements|
        elements.reduce(:*)
      end.each_slice(@data.length).to_a
    end

    def generate_with_headers(opts)
      corner = opts.fetch(:corner) { nil }
      header = [corner] + @data
      with_headers = @data.zip(generate_raw).map(&:flatten)
      with_headers.unshift header
    end
  end
end
