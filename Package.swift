// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "PerfectSQLite",
    platforms: [
        .macOS(.v10_15),
        .macCatalyst(.v13),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "PerfectSQLite",
            targets: [
                "PerfectSQLite"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/richardpiazza/Perfect-CRUD", from: "2.1.0"),
    ],
    targets: [
        .target(
            name: "PerfectSQLite",
            dependencies: [
                .product(name: "PerfectCRUD", package: "Perfect-CRUD"),
            ]
        ),
        .testTarget(
            name: "PerfectSQLiteTests",
            dependencies: [
                "PerfectSQLite"
            ]
        )
    ]
)

