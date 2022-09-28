# flutter_bump_version plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-flutter_bump_version)
[![Plugin Version](https://badge.fury.io/rb/fastlane-plugin-flutter_bump_version.svg)](https://badge.fury.io/rb/fastlane-plugin-flutter_bump_version)
[![Test](https://github.com/M97Chahboun/fastlane-plugin-flutter_bump_version/actions/workflows/test.yml/badge.svg)](https://github.com/M97Chahboun/fastlane-plugin-flutter_bump_version/actions/workflows/test.yml)
## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-flutter_bump_version`, add it to your project by running:

```bash
fastlane add_plugin flutter_bump_version
```

## About flutter_bump_version

Manages Flutter project version

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane bump_version bump:patch push:false`.

You can `bump` multi parts of version you want by use instead of `patch` (`major`,`minor` or `patch`) split it by (,)

As Example :

old version : 1.0.0

```sh
[bundle exec] fastlane bump_version bump:major,minor,minor,patch
```
new version : 2.2.1

build (version code) auto-increase based on current version code
if you not pass any option or wrong option with command will bump build as default

And the `push` if `true` plugin will push bump version to git remote if `false` will not push it

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).

