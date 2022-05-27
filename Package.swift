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
        .systemLibrary(
            name: "CSQLite",
            pkgConfig: "sqlite3",
            providers: [
                .apt(["sqlite3", "libsqlite3-dev"])
            ]
        ),
        .target(
            name: "PerfectSQLite",
            dependencies: [
                .product(name: "PerfectCRUD", package: "Perfect-CRUD"),
                .target(name: "CSQLite", condition: .when(platforms: [.linux])),
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

