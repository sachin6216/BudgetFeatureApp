// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Packages",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "BudgetFeature", targets: ["BudgetFeature"]),
    ],
    targets: [
        .target(name: "BudgetFeature"),
        .testTarget(name: "BudgetFeatureTests",dependencies: ["BudgetFeature"]),
    ]
)
