// swift-tools-version:5.4

import PackageDescription


let package = Package(
    name: "Analyst",
    platforms: [.macOS(.v10_15), .iOS(.v13)],
    products: [
        .library(
            name: "Analyst",
            targets: ["MetricAnalyst", "TraceAnalyst"]
        ),
        .library(
            name: "MetricAnalyst",
            targets: ["MetricAnalyst"]
        ),
        .library(
            name: "PrometheusAnalyst",
            targets: ["PrometheusAnalyst"]
        ),
        .library(
            name: "TraceAnalyst",
            targets: ["TraceAnalyst"]
        ),
        .library(
            name: "JaegerAnalyst",
            targets: ["JaegerAnalyst"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-metrics.git", "1.0.0" ..< "3.0.0"),
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.1.0"),
    ],
    targets: [
        .target(
            name: "MetricAnalyst",
            dependencies: [
                .product(name: "CoreMetrics", package: "swift-metrics")
            ]
        ),
        .target(
            name: "PrometheusAnalyst",
            dependencies: [
                .target(name: "MetricAnalyst"),
            ]
        ),
        .target(
            name: "TraceAnalyst",
            dependencies: []
        ),
        .target(
            name: "JaegerAnalyst",
            dependencies: [
                .target(name: "TraceAnalyst"),
                .product(name: "GRPC", package: "grpc-swift")
            ]
        ),
        .testTarget(
            name: "JaegerAnalystTests",
            dependencies: ["JaegerAnalyst"]
        ),
        .testTarget(
            name: "PrometheusAnalystTests",
            dependencies: ["PrometheusAnalyst"],
            resources: [.copy("prometheus")]
        )
    ]
)
