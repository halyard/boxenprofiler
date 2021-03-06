##
# Profile runtime definitions
module BoxenProfiler
  REGEX_PATTERNS = [
    /^Info: .*([A-Z][^\[]+)\[(.+?)\]: Evaluated in ([\d\.]+) seconds$/,
    /^Notice: Compiled (catalog) .* environment ([^ ]+) in ([\d\.]+) seconds$/
  ].freeze

  DEFAULT_RESULT_COUNT = 100

  ##
  # Profiler runtime class
  class Profiler
    def run!
      results = parse(`#{command}`.split("\n"))
      results.sort! { |a, b| b.last <=> a.last }
      write results
    end

    private

    def write(results)
      results.lazy.take(DEFAULT_RESULT_COUNT).each do |pclass, name, time|
        puts format('%6.2f - %s[%s]', time, pclass, name)
      end
    end

    def parse(lines)
      lines.each_with_object([]) do |line, acc|
        next unless REGEX_PATTERNS.find { |pattern| line.match(pattern) }
        pclass, name, time = Regexp.last_match[1..3]
        time = time.to_f
        next if time.zero?
        acc << [pclass, name, time]
      end
    end

    def command
      'boxen --profile --no-color'
    end
  end
end
