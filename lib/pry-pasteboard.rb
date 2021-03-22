require 'pry' unless defined?(::Pry)
require 'clipboard'

module PryPasteboard
  Commands = Pry::CommandSet.new do
    create_command "pbcopy", "Copy result to clipboard" do
      banner <<-BANNER
      Usage: pbcopy <evaluator>
      BANNER

      def process
        Clipboard.copy target.eval(arg_string)
      end
    end
  end
end

Pry.config.commands.import PryPasteboard::Commands
