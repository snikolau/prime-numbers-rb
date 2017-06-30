# Main module which contains all classes responsible for
# solving prime number tasks
module PrimerTask
  # Helper method
  # Allows call directly 'first' method from generator
  def first(n, generator = PrimerTask::Generator.new)
    generator.first(n)
  end
  module_function :first

  # Default prime generator
  class Generator
    def initialize
      setup
    end

    # Take first n of prime numbers.
    # Reuse cache if n amount of numbers has been already generated
    def first(n)
      if cache.size >= n
        cache[0..n - 1]
      else
        generate_primes(n)
        cache
      end
    end

    def next
      prime = @fiber.resume
      cache << prime
      prime
    end

    private
    attr_reader :cache

    def setup
      @cache = []
      @fiber = Fiber.new do
        Fiber.yield 2
        value = 3
        loop do
          Fiber.yield value if prime?(value)
          value += 2
        end
      end
    end

    def generate_primes(n)
      required = n - cache.size
      required.times do
        self.next
      end
    end


    def prime?(number)
      if number <= 3
        number > 1
      elsif number.even? || number % 3 == 0
        return false
      else
        (5..Math.sqrt(number).ceil).step(6) do |i|
          return false if number % i == 0 || number % (i + 2) == 0
        end
        true
      end
    end
  end
end
