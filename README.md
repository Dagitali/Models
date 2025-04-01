# Models

![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/Dagitali/Models?sort=semver)
![Build Status](https://github.com/Dagitali/Models/actions/workflows/lint.yml/badge.svg)
![Build Status](https://github.com/Dagitali/Models/actions/workflows/test.yml/badge.svg)
![Build Status](https://github.com/Dagitali/Models/actions/workflows/release.yml/badge.svg)
![Build Status](https://github.com/Dagitali/Models/actions/workflows/document.yml/badge.svg)
![Build Status](https://github.com/Dagitali/Models/actions/workflows/publish.yml/badge.svg)
![Codecov](https://codecov.io/gh/Dagitali/Models/branch/main/graph/badge.svg)
![GitHub](https://img.shields.io/github/license/Dagitali/Models)
![GitHub issues](https://img.shields.io/github/issues/Dagitali/Models)
![GitHub pull requests](https://img.shields.io/github/issues-pr/Dagitali/Models)
![GitHub top language](https://img.shields.io/github/languages/top/Dagitali/Models)
![GitHub repo size](https://img.shields.io/github/repo-size/Dagitali/Models)
![GitHub contributors](https://img.shields.io/github/contributors/Dagitali/Models)

A Swift package that includes an integrated collection Swift protocols for common data model
patterns.

- [Models](#models)
  - [Overview](#overview)
  - [Features](#features)
    - [Events](#events)
    - [Geography](#geography)
    - [Metadata](#metadata)
    - [People](#people)
    - [UI](#ui)
  - [Installation](#installation)
    - [Using Swift Package Manager (SPM)](#using-swift-package-manager-spm)
  - [Testing](#testing)
  - [Documentation](#documentation)
    - [Community Health](#community-health)
    - [Project](#project)
  - [Contributing](#contributing)
  - [License](#license)
  - [Acknowledgments](#acknowledgments)

## Overview

Models is a Swift package designed to provide lightweight, reusable protocols for common data
models.  It simplifies everyday coding tasks by offering integrated abstractions for these models.

This package focuses on providing practical protocols that:

- Formalize patterns found in common data models.
- Enhance reusability and readability of data-related code in Swift projects.

By integrating Models into your project, you can reduce boilerplate code, improve readability and
maintainability, and adopt standardized patterns for data models in modern Swift apps and packages.

## Features

Models provides reusable protocols and strongly typed data structures for common domains.  It
enhances type safety, standardizes data representation, and promotes consistency across Swift-based
projects.

### Events

Encapsulate scheduling and tracking concepts to support time-based activities and event management.

- Protocols
  - `Schedulable`
  - `Trackable`

### Geography

Define structured representations of geographic and administrative regions to standardize
location-based data.

- Enums
  - `AdministrativeZone`
  - `Country`
- Protocols
  - `Locatable`

### Metadata

Enable tracking record-level changes, ensuring data integrity and historical traceability.

- Protocols
  - `Trackable`

### People

Model individual and demographic characteristics to standardize identity-related data.

- Enums
  - `AgeBracket`
  - `Gender`
- Protocols
  - `Personable`

### UI

Ensure consistent representation of models across user interfaces using visual elements and system
imagery.

- Protocol
  - `SystemImageRepresentable`

## Installation

### Using Swift Package Manager (SPM)

To integrate Models into your project:

1. Open your project in **Xcode**.
2. Navigate to **File > Add Packages**.
3. Enter the URL for this repository:

   <https://github.com/Dagitali/Models>

4. Select the latest version and add it to your target.

## Testing

The package includes a comprehensive test suite to ensure reliability.  Run tests with:

```bash
swift test
```

## Documentation

For detailed API documentation and more usage examples, visit the [Models][docs] documentation
site.  For project documentation, refer to the files listed in the subsections that follow.

### Community Health

- [Code of Conduct](CODE_OF_CONDUCT.md)
- [Contributing](CONTRIBUTING.md)

### Project

- [References](REFERENCES.md)

## Contributing

Contributions are welcome!  If you’d like to add a new feature, fix a bug, or improve the
documentation:

1. Fork this repository.
2. Create a new feature branch for your changes (`git checkout -b feature/feature-name`).
3. Commit your changes (`git commit -m "Add feature"`).
4. Push to your branch (`git push origin feature-name`).
5. Submit a pull request with a detailed description.

## License

Models is available under the [MIT License](LICENSE).

## Acknowledgments

Models is inspired by common patterns in Swift development, aiming to reduce boilerplate code and
increase productivity.  Feedback and contributions are always appreciated!

Special thanks to the Swift community for fostering creativity and collaboration.

[docs]: https://dagitali.github.io/Models/documentation/models/
