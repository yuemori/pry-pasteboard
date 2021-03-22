require 'pry' unless defined?(::Pry)
require 'clipboard'

module PryClipboard
  Commands = Pry::CommandSet.new do
    create_command "clip", "Copy result to clipboard" do
      banner <<-BANNER
      Usage: clip <evaluator>
      BANNER

      def process
        Clipboard.copy target.eval(arg_string)
      end
    end
  end
end

Pry.config.commands.import PryClipboard::Commands
