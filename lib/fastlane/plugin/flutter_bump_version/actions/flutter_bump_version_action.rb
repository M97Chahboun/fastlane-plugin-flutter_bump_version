require 'fastlane'
require_relative '../helper/flutter_bump_version_helper'
require 'yaml'

module Fastlane
  module Actions
    class YamlReader
      def initialize(yaml_path)
        @yaml_file = YAML.load_file(yaml_path)
      end

      def field(field_name)
        @yaml_file[field_name]
      end

      def all
        @yaml_file
      end
    end

    class FileReader
      def initialize(yaml_path)
        @yaml_path = yaml_path
      end

      def read
        IO.readlines(@yaml_path)
      end
    end

    class FileWritter
      def initialize(yaml_path)
        @yaml_path = yaml_path
      end

      def write(content)
        File.open(@yaml_path, "w") do |file|
          file.puts(content)
          file.close
        end
      end
    end

    class FlutterBumpVersion
      def initialize(pubspec_path)
        @pubspec_yaml_reader = YamlReader.new(pubspec_path)
        @pubspec_file_reader = FileReader.new(pubspec_path)
        @pubspec_file_writter = FileWritter.new(pubspec_path)
      end

      def congigure_major
        return @is_major ? @current_version_in_hash['major'] + 1 : @current_version_in_hash['major']
      end

      def configure_minor
        if @is_minor
          @current_version_in_hash['minor'] + 1
        else
          @is_major ? 0 : @current_version_in_hash['minor']
        end
      end

      def configure_patch
        if @is_patch
          @current_version_in_hash['patch'] + 1
        else
          @is_major || @is_minor ? 0 : @current_version_in_hash['patch']
        end
      end

      def configure_build
        if @is_build
          @current_version_in_hash['build'] + 1
        else
          @is_major || @is_minor || @is_patch ? 0 : @current_version_in_hash['minor']
        end
      end

      def bump_version(part)
        @is_major = part == "major"
        @is_minor = part == "minor"
        @is_patch = part == "patch"
        @is_build = part == "build"
        current_version = @pubspec_yaml_reader.field('version')
        split_current_version = current_version.split(".")
        build_exist = current_version.count("+") != 0
        patch = build_exist ? split_current_version.last.split("+")[0] : split_current_version[2]
        build = build_exist ? split_current_version.last.split("+")[1] : "0"
        @current_version_in_hash = Hash("major" => split_current_version[0].to_i, "minor" => split_current_version[1].to_i, "patch" => patch.to_i, "build" => build.to_i)
        @current_version_in_hash['major'] = congigure_major
        @current_version_in_hash['minor'] = configure_minor
        @current_version_in_hash['patch'] = configure_patch
        @current_version_in_hash['build'] = configure_build
        new_version = "#{@current_version_in_hash['major']}.#{@current_version_in_hash['minor']}.#{@current_version_in_hash['patch']}"
        new_version = @is_build ? new_version + "+#{@current_version_in_hash['build']}" : new_version
        update_pubspec(new_version, current_version)
      end

      def update_pubspec(new_version, current_version)
        version_string = "version: "
        new_content = @pubspec_file_reader.read.map { |s| s.gsub(version_string + current_version, version_string + new_version) }
        @pubspec_file_writter.write(new_content)
        UI.message("Previous app version: #{current_version}")
        UI.message("New app version: #{new_version}")
      end
    end

    class FlutterBumpVersionAction < Action
      def self.run(params)
        pubspec_path = params[:pubspec] || '../'
        arguments = params[:arguments]
        args = arguments.keys
        bump_version = FlutterBumpVersion.new(pubspec_path)
        # Check if the user has passed additional arguments
        if args.include?(:bump)
          args.each do |a|
            case a
            when :bump
              bump_version.bump_version(arguments[:bump])
            end
          end
        else
          UI.message("Something wrong, Try: bundle exec fastlane bump_version bump:major,minor,patch or build")
        end
      end

      def self.description
        "Fastlane plugin for upgrade flutter projects version by any part (major,minor,patch or build)"
      end

      def self.authors
        ["Mohammed chahboun"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        "App versioning tool for Flutter projects that can be integrate easily into pipeline via CI/CD"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :pubspec,
            description: "Path to pubspec.yaml",
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :arguments,
            description: "part you want upgrade (major,minor,patch or build)",
            optional: true,
            type: Hash
          )
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
