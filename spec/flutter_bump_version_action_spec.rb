describe Fastlane::Actions::FlutterBumpVersionAction do
  describe '#run' do
    it 'Bump major & Show Previous & New Version' do
      expect(Fastlane::UI).to receive(:message).with("Previous app version: 1.0.0")
      expect(Fastlane::UI).to receive(:message).with("New app version: 2.0.0")

      Fastlane::Actions::FlutterBumpVersionAction.run(pubspec: "./pubspec.yaml", arguments: { bump: 'major' })
    end
    it 'Bump minor & Show Previous & New Version' do
      expect(Fastlane::UI).to receive(:message).with("Previous app version: 2.0.0")
      expect(Fastlane::UI).to receive(:message).with("New app version: 2.1.0")

      Fastlane::Actions::FlutterBumpVersionAction.run(pubspec: "./pubspec.yaml", arguments: { bump: 'minor' })
    end
    it 'Bump patch & Show Previous & New Version' do
      expect(Fastlane::UI).to receive(:message).with("Previous app version: 2.1.0")
      expect(Fastlane::UI).to receive(:message).with("New app version: 2.1.1")

      Fastlane::Actions::FlutterBumpVersionAction.run(pubspec: "./pubspec.yaml", arguments: { bump: 'patch' })
    end
    it 'Bump build & Show Previous & New Version' do
      expect(Fastlane::UI).to receive(:message).with("Previous app version: 2.1.1")
      expect(Fastlane::UI).to receive(:message).with("New app version: 2.1.1+1")

      Fastlane::Actions::FlutterBumpVersionAction.run(pubspec: "./pubspec.yaml", arguments: { bump: 'build' })
    end
    it 'Pass wrong option & Show available options' do
      expect(Fastlane::UI).to receive(:message).with('You pass with bump wrong option, Available options : ["major", "minor", "patch", "build"]')
      Fastlane::Actions::FlutterBumpVersionAction.run(pubspec: "./pubspec.yaml", arguments: { bump: 'wrong_option' })
    end
  end
end
