# Forecast Product

Forecast products against actual orders

This project was made to guide on the usage of calling asynchronous API of forecast and orders of products, analyze difference in forecast against orders.

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

![minio_SWIFT1](http://i64.tinypic.com/not1k4.png)

## Version

1.0

## Prerequisites

- Xcode 10 or later
- iOS 12 or later
- macOS 10.13 or later

## 1. Dependencies

We will be building this app using Xcode 10 with Swift 4.2. This app will consume the GitHub hosted Json API Service built to fetch forecast and orders of products since server isn't accessible.

- Xcode 10
- Swift 4.2

## 2. Written in Swift

This sample is written in Swift.

## Design Patterns

- ### MVC

Model-View-Controller (MVC) is one of the building blocks of Cocoa and is undoubtedly the most-used design pattern of all. It classifies objects according to their general role in your application and encourages clean separation of code based on role.

![minio_SWIFT1](https://koenig-media.raywenderlich.com/uploads/2013/07/mvc0.png)

- ### Facade

The Facade design pattern provides a single interface to a complex subsystem. Instead of exposing the user to a set of classes and their APIs, you only expose one simple unified API.

![minio_SWIFT1](https://koenig-media.raywenderlich.com/uploads/2013/07/facade2.png)

- ### Decorator

The Decorator pattern dynamically adds behaviors and responsibilities to an object without modifying its code. It’s an alternative to subclassing where you modify a class’s behavior by wrapping it with another object.

In Swift, there are two very common implementations of this pattern: Extensions and Delegation.

## Features

- API class : `APIManager`
- MVC pattern used (recommanded by Apple)
- Modular enough to add others calls from APIManager API.

## Installation

```
1.  Clone or download the repository
```

- Go to working directory

```
2.  Open the project:
```

$ open Forecast.xcodeproj

```
- Use command + B or Product -> Build to build the project
- Press run icon in Xcode or command + R to run the project on Simulator
```

## Step to run the project from command-line

- Make sure command-line tools of Xcode is installed
- Go to working Directory
- xcodebuild -scheme Forecast build -allowProvisioningUpdates

## Step to run unit test

- Open Forecast.xcodeproj
- Use Command+U or Product+Test to analyze the project

![minio_SWIFT1](http://i65.tinypic.com/2jfn4sp.png)

## Step to static code coverage

- Open Forecast.xcodeproj
- Use Command+Shift+B or Product+Analyze to analyze the project

![minio_SWIFT1](http://i64.tinypic.com/o0nzme.png)

## To Do

### Heroku server API

- Host forecast and orders api on [Heroku cloud](https://www.heroku.com)

### CI/CD

- [Jenkins](http://jenkins.io)
- [HockeyApp](https://hockeyapp.net)
- [TestFlight](https://developer.apple.com/testflight/)
- [fastlane](https://fastlane.tools)
- [Xcode Server](https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/xcode_guide-continuous_integration/index.html)

### Crash Reporting

- [Crashlytics](http://try.crashlytics.com/reports/)

## License

Distributed under the MIT license. See `LICENSE` for more information.

[https://github.com/laxmansahni/Forecast/blob/master/LICENSE](https://github.com/laxmansahni/Forecast/blob/master/LICENSE)

[swift-image]: https://img.shields.io/badge/swift-4.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
