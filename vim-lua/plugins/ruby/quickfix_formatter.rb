# rspec --format progress --require ~/config/vim/ruby/quickfix_formatter.rb --format QuickfixFormatter --out quickfix.out spec
# From https://www.philipbradley.net/posts/rspec-into-vim-with-quickfix/
class QuickfixFormatter
  RSpec::Core::Formatters.register self, :example_failed

  def initialize(output)
    @output = output
  end

  def example_failed(notification)
    @output << format(notification) + "\n"
  end

  private

  def format(notification)
    rtn = "%s: %s" % [notification.example.location, notification.exception.message]
    rtn.gsub("\n", ' ')[0,160]
  end
end
