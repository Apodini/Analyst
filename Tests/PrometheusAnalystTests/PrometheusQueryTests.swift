//
//  AnalystTests.swift
//  
//
//  Created by Paul Schmiedmayer on 6/17/21.
//

import PrometheusAnalyst
import XCTest

@available(macOS 12, *)
final class PrometheusQueryTests: XCTestCase {

    // MARK: Tests

    func testExamples() {

        check(
            vector: "http_requests_total",
            expected: "http_requests_total"
        )

        check(
            vector: Counter(label: "http_requests_total"),
            expected: "http_requests_total"
        )

        check(
            vector:  "http_requests_total".where { "job" == "apiserver" && "handler" == "/api/comments" },
            expected: #"http_requests_total{job="apiserver",handler="/api/comments"}"#
        )

        check(
            vector: Counter(label: "http_requests_total", dimensions: [("job", "apiserver"), ("handler", "/api/comments")]),
            expected: #"http_requests_total{job="apiserver",handler="/api/comments"}"#
        )

        check(
            range: "http_requests_total".where { "job" == "apiserver" && "handler" == "/api/comments" }[.minutes(5)],
            expected: #"http_requests_total{job="apiserver",handler="/api/comments"}[5m]"#
        )

        check(
            vector: "http_requests_total".where { "job" =~ ".*server" },
            expected: #"http_requests_total{job=~".*server"}"#
        )

        check(
            vector: "http_requests_total".where { "status" !~ "4.." },
            expected: #"http_requests_total{status!~"4.."}"#
        )

        check(
            range: .rate("http_requests_total"[.minutes(5)])[.minutes(30), .minutes(1)],
            expected: #"(rate(http_requests_total[5m]))[30m:1m]"#
        )

        check(
            vector: .maximumOverTime(.derivative(of: .rate("distance_covered_total"[.seconds(5)])[.seconds(30), .seconds(5)])[.minutes(10), .none]),
            expected: #"max_over_time((deriv((rate(distance_covered_total[5s]))[30s:5s]))[10m:])"#
        )

        check(
            vector: .rate("http_requests_total"[.minutes(5)]),
            expected: #"rate(http_requests_total[5m])"#
        )

        check(
            vector: .sum(.rate("http_requests_total"[.minutes(5)]), rule: .by("job")),
            expected: #"sum(rate(http_requests_total[5m])) by (job)"#
        )

        check(
            vector: ("instance_memory_limit_bytes" - "instance_memory_usage_bytes") / 1024 / 1024,
            expected: #"(((instance_memory_limit_bytes)-(instance_memory_usage_bytes))/(1024))/(1024)"#
        )

        check(
            vector: .sum(("instance_memory_limit_bytes" - "instance_memory_usage_bytes") / 1024 / 1024, rule: .by("app", "proc")),
            expected: #"sum((((instance_memory_limit_bytes)-(instance_memory_usage_bytes))/(1024))/(1024)) by (app,proc)"#
        )

        check(
            vector: "instance_cpu_time_ns".where { "app" == "lion" && "proc" == "web" },
            expected: #"instance_cpu_time_ns{app="lion",proc="web"}"#
        )

        check(
            vector: .top(3, .sum(.rate("instance_cpu_time_ns"[.minutes(5)]), rule: .by("app", "proc"))),
            expected: #"topk(3,sum(rate(instance_cpu_time_ns[5m])) by (app,proc))"#
        )

        check(
            vector: .count("instance_cpu_time_ns", rule: .by("app")),
            expected: #"count(instance_cpu_time_ns) by (app)"#
        )

    }

    // MARK: Helpers

    private func check<Query: ScalarMetricQuery & PrometheusRepresentable>(
        scalar query: Query,
        expected: String
    ) {
        XCTAssertEqual(query.prometheusRepresentation, expected)
    }

    private func check<Query: VectorMetricQuery & PrometheusRepresentable>(
        vector query: Query,
        expected: String
    ) {
        XCTAssertEqual(query.prometheusRepresentation, expected)
    }

    private func check<Query: RangeMetricQuery & PrometheusRepresentable>(
        range query: Query,
        expected: String
    ) {
        XCTAssertEqual(query.prometheusRepresentation, expected)
    }

}
