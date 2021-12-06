
import Foundation

@available(macOS 12, iOS 15, *)
public protocol PrometheusProvider: AnyObject {

    // MARK: - Configuration

    func fetchConfiguration() async throws -> String
    func fetchFlags() async throws -> [String: String]

    // MARK: - Metadata

    func fetchSeries(
        matching matches: [VectorMetricQuery & PrometheusRepresentable],
        from start: Date,
        to end: Date
    ) async throws -> [[String:String]]

    func fetchLabels(
        matching matches: [VectorMetricQuery & PrometheusRepresentable],
        from start: Date?,
        to end: Date?
    ) async throws -> [String]

    func fetchValues(
        forLabel label: String,
        matching matches: [VectorMetricQuery & PrometheusRepresentable],
        from start: Date?,
        to end: Date?
    ) async throws -> [String]

    // MARK: - Scalar

    func fetch<Query: ScalarMetricQuery & PrometheusRepresentable>(
        scalar query: Query,
        at date: Date?,
        timeout: Double?
    ) async throws -> ScalarQueryResponse

    func fetch<Query: ScalarMetricQuery & PrometheusRepresentable>(
        scalar query: Query,
        from start: Date,
        to end: Date,
        step: Double,
        timeout: Double?
    ) async throws -> ScalarQueryResponse

    // MARK: - Vector

    func fetch<Query: VectorMetricQuery & PrometheusRepresentable>(
        vector query: Query,
        at date: Date?,
        timeout: Double?
    ) async throws -> [VectorQueryResponse]

    func fetch<Query: VectorMetricQuery & PrometheusRepresentable>(
        vector query: Query,
        from start: Date,
        to end: Date,
        step: Double,
        timeout: Double?
    ) async throws -> [VectorQueryResponse]

    // MARK: - Range

    func fetch<Query: RangeMetricQuery & PrometheusRepresentable>(
        range query: Query,
        at date: Date?,
        timeout: Double?
    ) async throws -> [RangeQueryResponse]

    func fetch<Query: RangeMetricQuery & PrometheusRepresentable>(
        range query: Query,
        from start: Date,
        to end: Date,
        step: Double,
        timeout: Double?
    ) async throws -> [RangeQueryResponse]

}
