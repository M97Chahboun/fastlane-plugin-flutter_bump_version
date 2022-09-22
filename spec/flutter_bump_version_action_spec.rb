describe Fastlane::Actions::FlutterBumpVersionAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("Previous app version: 1.0.0")
      expect(Fastlane::UI).to receive(:message).with("New app version: 2.0.0")

      Fastlane::Actions::FlutterBumpVersionAction.run(pubspec: "./pubspec.yaml", arguments: { bump: 'major' })
    end
  end
end
