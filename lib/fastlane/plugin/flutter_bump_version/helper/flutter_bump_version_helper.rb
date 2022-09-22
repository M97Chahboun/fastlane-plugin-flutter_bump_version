require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?(:UI)

  module Helper
    class FlutterBumpVersionHelper
      # class methods that you define here become available in your action
      # as `Helper::FlutterBumpVersionHelper.your_method`
      #
      def self.show_message
      end
    end
  end
end
