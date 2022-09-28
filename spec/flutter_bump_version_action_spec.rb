describe Fastlane::Actions::FlutterBumpVersionAction do
  describe '#run' do
    it 'Bump major,patch,minor,minor & Show Previous & New Version' do
      expect(Fastlane::UI).to receive(:message).with("Previous app version: 1.0.0")
      expect(Fastlane::UI).to receive(:message).with("New app version: 2.2.1+1")

      Fastlane::Actions::FlutterBumpVersionAction.run(pubspec: "./pubspec.yaml", parts: 'major,patch,minor,minor')
    end
    it 'Bump minor,major & Show Previous & New Version' do
      expect(Fastlane::UI).to receive(:message).with("Previous app version: 2.2.1+1")
      expect(Fastlane::UI).to receive(:message).with("New app version: 3.1.0+2")

      Fastlane::Actions::FlutterBumpVersionAction.run(pubspec: "./pubspec.yaml", parts: 'minor,major')
    end
    it 'Bump only patch & Show Previous & New Version' do
      expect(Fastlane::UI).to receive(:message).with("Previous app version: 3.1.0+2")
      expect(Fastlane::UI).to receive(:message).with("New app version: 3.1.1+3")

      Fastlane::Actions::FlutterBumpVersionAction.run(pubspec: "./pubspec.yaml", parts: 'patch')
    end
    it 'Bump only major & Show Previous & New Version' do
      expect(Fastlane::UI).to receive(:message).with("Previous app version: 3.1.1+3")
      expect(Fastlane::UI).to receive(:message).with("New app version: 4.0.0+4")

      Fastlane::Actions::FlutterBumpVersionAction.run(pubspec: "./pubspec.yaml", parts: 'major')
    end
    it 'Bump only minor & Show Previous & New Version' do
      expect(Fastlane::UI).to receive(:message).with("Previous app version: 4.0.0+4")
      expect(Fastlane::UI).to receive(:message).with("New app version: 4.1.0+5")

      Fastlane::Actions::FlutterBumpVersionAction.run(pubspec: "./pubspec.yaml", parts: 'minor')
    end
    it 'Run command without any option or wrong option will bump build as default' do
      expect(Fastlane::UI).to receive(:message).with("Previous app version: 4.1.0+5")
      expect(Fastlane::UI).to receive(:message).with("New app version: 4.1.0+6")
      Fastlane::Actions::FlutterBumpVersionAction.run(pubspec: "./pubspec.yaml")
    end
  end
end
