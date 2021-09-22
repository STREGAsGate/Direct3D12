
# Direct3D12 for Swift
[![Windows](https://github.com/STREGAsGate/Direct3D12/actions/workflows/Windows%20CI.yml/badge.svg)](https://github.com/STREGAsGate/Direct3D12/actions/workflows/Windows%20CI.yml)

[![Twitter](https://img.shields.io/twitter/follow/stregasgate?style=social)](https://twitter.com/stregasgate)
[![YouTube](https://img.shields.io/youtube/channel/subscribers/UCBXFkK2B4w9856wBJfCGufg?label=Subscribe&style=social)](https://youtube.com/stregasgate)
[![Reddit](https://img.shields.io/reddit/subreddit-subscribers/stregasgate?style=social)](https://www.reddit.com/r/stregasgate/)
[![Discord](https://img.shields.io/discord/641809158051725322?label=Hang%20Out&logo=Discord&style=social)](https://discord.gg/5JdRJhD)

This package exposes the DirectX 12 low level API to Swift.

Source files are partitioned and named to mirror the orignal API locations and naming which makes everything easier to locate and maintain based on the original API documentation.

The goal of this package is to translate every API into a Swifty format.
The API is kept similar-ish to the original for familiarity.
Windows stuff like ComPtrs and GUIDs are handled transparently.

A shell version of the original API is available and marked `unavailable` or `deprecated` to allow fast migration. So typing in an original API will result in the compiler providing tips to help migrate your code.
The Swift Setting `Direct3D12ExcludeOriginalStyleAPI` will remove all these helpers when defined and is defined by default for `release` configurations. These helpers have no implementation, they exist to help you migrate to the real API.
