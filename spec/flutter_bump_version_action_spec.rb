describe Fastlane::Actions::FlutterBumpVersionAction do
  describe '#run' do
    it 'Bump major & Show Previous & New Version' do
      expect(Fastlane::UI).to receive(:message).with("Previous app version: 1.0.0")
      expect(Fastlane::UI).to receive(:message).with("New app version: 2.0.0+1")

      Fastlane::Actions::FlutterBumpVersionAction.run(pubspec: "./pubspec.yaml", part: 'major')
    end
    it 'Bump minor & Show Previous & New Version' do
      expect(Fastlane::UI).to receive(:message).with("Previous app version: 2.0.0+1")
      expect(Fastlane::UI).to receive(:message).with("New app version: 2.1.0+2")

      Fastlane::Actions::FlutterBumpVersionAction.run(pubspec: "./pubspec.yaml", part: 'minor')
    end
    it 'Bump patch & Show Previous & New Version' do
      expect(Fastlane::UI).to receive(:message).with("Previous app version: 2.1.0+2")
      expect(Fastlane::UI).to receive(:message).with("New app version: 2.1.1+3")

      Fastlane::Actions::FlutterBumpVersionAction.run(pubspec: "./pubspec.yaml", part: 'patch')
    end
    it 'Run command without any option or wrong option wibuild asefault' do
      expect(Fastlane::UI).to receive(:message).with("Previous app version: 2.1.1+3")
      expect(Fastlane::UI).to receive(:message).with("New app version: 2.1.1+4")
      Fastlane::Actions::FlutterBumpVersionAction.run(pubspec: "./pubspec.yaml")
    end
  end
end
