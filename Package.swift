// swift-tools-version:5.4

import PackageDescription


let package = Package(
    name: "Analyst",
    platforms: [.macOS(.v10_15), .iOS(.v13)],
    products: [
        .library(
            name: "Analyst",
            targets: ["Analyst"]
        ),
        .library(
            name: "JaegerAnalyst",
            targets: ["Analyst", "JaegerAnalyst"]
        ),
        .library(
            name: "AnalystPresenter",
            targets: ["Analyst", "AnalystPresenter"]
        ),
        .library(
            name: "PrometheusAnalyst",
            targets: ["Analyst", "PrometheusAnalyst"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.22.0"),
        .package(url: "https://github.com/grpc/grpc-swift.git", .exact("1.0.0-alpha.15")),
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.0.0"),
        .package(url: "https://github.com/Apodini/Presenter.git", .branch("develop"))
    ],
    targets: [
        .target(
            name: "Analyst",
            dependencies: [
                .product(name: "NIO", package: "swift-nio"),
            ]
        ),
        .target(
            name: "JaegerAnalyst",
            dependencies: [
                .target(name: "Analyst"),
                .product(name: "GRPC", package: "grpc-swift")
            ]
        ),
        .target(
            name: "AnalystPresenter",
            dependencies: [
                .target(name: "Analyst"),
                .product(name: "MetricPresenter", package: "Presenter"),
                .product(name: "TracePresenter", package: "Presenter"),
            ]
        ),
        .target(
            name: "PrometheusAnalyst",
            dependencies: [
                .target(name: "Analyst"),
                .product(name: "AsyncHTTPClient", package: "async-http-client"),
            ]
        ),
        .testTarget(
            name: "AnalystTests",
            dependencies: [
                .target(name: "Analyst")
            ]
        )
    ]
)
