// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "swift-function",
    dependencies: [
        .package(url: "https://github.com/appwrite/sdk-for-swift", .upToNextMajor(from: "4.1.0")),
    ],
    targets: [
        .executableTarget(
            name: "swift-function",
            dependencies: [
                .product(name: "Appwrite", package: "sdk-for-swift")
            ]),
    ]
)