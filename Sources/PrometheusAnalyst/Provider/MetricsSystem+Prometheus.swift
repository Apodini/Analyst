
import Foundation

@available(macOS 12, iOS 15, *)
extension MetricsSystem {

    // MARK: - Configuration

    public static func fetchConfiguration() async throws -> String {
        try await prometheusProvider.fetchConfiguration()
    }

    public static func fetchFlags() async throws -> [String: String] {
        try await prometheusProvider.fetchFlags()
    }

    // MARK: - Metadata

    public static func fetchSeries(
        matching matches: (VectorMetricQuery & PrometheusRepresentable)...,
        from start: Date,
        to end: Date
    ) async throws -> [[String:String]] {
        try await fetchSeries(
            matching: matches,
            from: start,
            to: end
        )
    }

    public static func fetchSeries(
        matching matches: [VectorMetricQuery & PrometheusRepresentable],
        from start: Date,
        to end: Date
    ) async throws -> [[String:String]] {
        try await prometheusProvider.fetchSeries(
            matching: matches,
            from: start,
            to: end
        )
    }

    public static func fetchLabels(
        matching matches: (VectorMetricQuery & PrometheusRepresentable)...,
        from start: Date? = nil,
        to end: Date? = nil
    ) async throws -> [String] {
        try await fetchLabels(
            matching: matches,
            from: start,
            to: end
        )
    }

    public static func fetchLabels(
        matching matches: [VectorMetricQuery & PrometheusRepresentable],
        from start: Date? = nil,
        to end: Date? = nil
    ) async throws -> [String] {
        try await prometheusProvider.fetchLabels(
            matching: matches,
            from: start,
            to: end
        )
    }

    public static func fetchValues(
        forLabel label: String,
        matching matches: (VectorMetricQuery & PrometheusRepresentable)...,
        from start: Date? = nil,
        to end: Date? = nil
    ) async throws -> [String] {
        try await fetchValues(
            forLabel: label,
            matching: matches,
            from: start,
            to: end
        )
    }

    public static func fetchValues(
        forLabel label: String,
        matching matches: [VectorMetricQuery & PrometheusRepresentable],
        from start: Date? = nil,
        to end: Date? = nil
    ) async throws -> [String] {
        try await prometheusProvider.fetchValues(
            forLabel: label,
            matching: matches,
            from: start,
            to: end
        )
    }

    // MARK: Queries

    public static func fetch<Query: ScalarMetricQuery & PrometheusRepresentable>(
        scalar query: Query,
        at date: Date? = nil,
        timeout: Double? = nil
    ) async throws -> ScalarQueryResponse {
        try await prometheusProvider.fetch(
            scalar: query,
            at: date,
            timeout: timeout
        )
    }

    public static func fetch<Query: ScalarMetricQuery & PrometheusRepresentable>(
        scalar query: Query,
        from start: Date,
        to end: Date,
        step: Double,
        timeout: Double? = nil
    ) async throws -> ScalarQueryResponse {
        try await prometheusProvider.fetch(
            scalar: query,
            from: start,
            to: end,
            step: step,
            timeout: timeout
        )
    }

    public static func fetch<Query: VectorMetricQuery & PrometheusRepresentable>(
        vector query: Query,
        at date: Date? = nil,
        timeout: Double? = nil
    ) async throws -> [VectorQueryResponse] {
        try await prometheusProvider.fetch(
            vector: query,
            at: date,
            timeout: timeout
        )
    }

    public static func fetch<Query: VectorMetricQuery & PrometheusRepresentable>(
        vector query: Query,
        from start: Date,
        to end: Date,
        step: Double,
        timeout: Double?
    ) async throws -> [VectorQueryResponse] {
        try await prometheusProvider.fetch(
            vector: query,
            from: start,
            to: end,
            step: step,
            timeout: timeout
        )
    }

    public static func fetch<Query: RangeMetricQuery & PrometheusRepresentable>(
        range query: Query,
        at date: Date?,
        timeout: Double?
    ) async throws -> [RangeQueryResponse] {
        try await prometheusProvider.fetch(
            range: query,
            at: date,
            timeout: timeout
        )
    }

    public static func fetch<Query: RangeMetricQuery & PrometheusRepresentable>(
        range query: Query,
        from start: Date,
        to end: Date,
        step: Double,
        timeout: Double?
    ) async throws -> [RangeQueryResponse] {
        try await prometheusProvider.fetch(
            range: query,
            from: start,
            to: end,
            step: step,
            timeout: timeout
        )
    }

}
