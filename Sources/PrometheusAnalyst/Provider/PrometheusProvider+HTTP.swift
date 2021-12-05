
import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

@available(macOS 12, iOS 15, *)
internal final class HTTPPrometheusProvider: PrometheusProvider {

    // MARK: Nested Types

    private enum QueryItem {

        case start(Date?)
        case end(Date?)
        case timeout(Double?)
        case time(Date?)
        case step(Double?)
        case query(PrometheusRepresentable?)
        case match(PrometheusRepresentable?)

        var keyRepresentation: String {
            switch self {
            case .start:
                return "start"
            case .end:
                return "end"
            case .timeout:
                return "timeout"
            case .time:
                return "time"
            case .step:
                return "step"
            case .query:
                return "query"
            case .match:
                return "match[]"
            }
        }

        var valueRepresentation: String? {
            switch self {
            case let .start(date):
                return date?.timeIntervalSince1970.description
            case let .end(date):
                return date?.timeIntervalSince1970.description
            case let .timeout(seconds):
                return seconds?.description
            case let .time(date):
                return date?.timeIntervalSince1970.description
            case let .step(seconds):
                return seconds?.description
            case let .query(query):
                return query?.prometheusRepresentation
            case let .match(match):
                return match?.prometheusRepresentation
            }
        }

    }

    // MARK: Stored Properties

    let baseURL: URL
    let session: URLSession
    let decoder = JSONDecoder()

    // MARK: Initialization

    init(baseURL: URL, session: URLSession) {
        self.baseURL = baseURL
        self.session = session
    }

    // MARK: Methods - Configuration

    func fetchConfiguration() async throws -> String {
        let data = try await request("status/config", queryItems: [])
        return try decodeResponse(ofType: PrometheusConfiguration.self, from: data)
            .yaml
    }

    func fetchFlags() async throws -> [String : String] {
        let data = try await request("status/flags", queryItems: [])
        return try decodeResponse(ofType: [String: String].self, from: data)
    }

    // MARK: Methods - Metadata

    func fetchSeries(
        matching matches: [VectorMetricQuery & PrometheusRepresentable],
        from start: Date,
        to end: Date
    ) async throws -> [[String : String]] {
        let data = try await request("series", queryItems: [.start(start), .end(end)] + matches.map { .match($0) })
        return try decodeResponse(ofType: [[String: String]].self, from: data)
    }

    func fetchLabels(matching matches: [VectorMetricQuery & PrometheusRepresentable], from start: Date?, to end: Date?) async throws -> [String] {
        let data = try await request("labels", queryItems: [.start(start), .end(end)] + matches.map { .match($0) })
        return try decodeResponse(ofType: [String].self, from: data)
    }

    func fetchValues(forLabel label: String, matching matches: [VectorMetricQuery & PrometheusRepresentable], from start: Date?, to end: Date?) async throws -> [String] {
        guard let escapedLabel = label.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
            throw PrometheusProviderError.couldNotEncodeQuery(label)
        }
        let data = try await request("series/" + escapedLabel, queryItems: [.start(start), .end(end)] + matches.map { .match($0) })
        return try decodeResponse(ofType: [String].self, from: data)
    }

    // MARK: Methods - Queries

    func fetch<Query: ScalarMetricQuery & PrometheusRepresentable>(
        scalar query: Query,
        at date: Date? = nil,
        timeout: Double? = nil
    ) async throws -> ScalarQueryResponse {
        let data = try await request("query", queryItems: [.query(query), .time(date), .timeout(timeout)])
        let scalar = try decodeQueryResponse(from: data, for: \.scalar)
        return .init(date: scalar.date, value: scalar.value)
    }

    func fetch<Query: ScalarMetricQuery & PrometheusRepresentable>(
        scalar query: Query,
        from start: Date,
        to end: Date,
        step: Double,
        timeout: Double? = nil
    ) async throws -> ScalarQueryResponse {
        let data = try await request("query_range", queryItems: [.query(query), .start(start), .end(end), .step(step), .timeout(timeout)])
        let scalar = try decodeQueryResponse(from: data, for: \.scalar)
        return .init(date: scalar.date, value: scalar.value)
    }

    func fetch<Query: VectorMetricQuery & PrometheusRepresentable>(
        vector query: Query,
        at date: Date? = nil,
        timeout: Double? = nil
    ) async throws -> [VectorQueryResponse] {
        let data = try await request("query", queryItems: [.query(query), .time(date), .timeout(timeout)])
        return try decodeQueryResponse(from: data, for: \.vector)
            .map { .init(dimensions: $0.metric, value: .init(date: $0.value.date, value: $0.value.value)) }
    }

    func fetch<Query: VectorMetricQuery & PrometheusRepresentable>(
        vector query: Query,
        from start: Date,
        to end: Date,
        step: Double,
        timeout: Double? = nil
    ) async throws -> [VectorQueryResponse] {
        let data = try await request("query_range", queryItems: [.query(query), .start(start), .end(end), .step(step), .timeout(timeout)])
        return try decodeQueryResponse(from: data, for: \.vector)
            .map { .init(dimensions: $0.metric, value: .init(date: $0.value.date, value: $0.value.value)) }
    }

    func fetch<Query: RangeMetricQuery & PrometheusRepresentable>(
        range query: Query,
        at date: Date? = nil,
        timeout: Double? = nil
    ) async throws -> [RangeQueryResponse] {
        let data = try await request("query", queryItems: [.query(query), .time(date), .timeout(timeout)])
        return try decodeQueryResponse(from: data, for: \.range)
            .map { .init(dimensions: $0.metric, values: $0.values.map { .init(date: $0.date, value: $0.value) }) }
    }

    func fetch<Query: RangeMetricQuery & PrometheusRepresentable>(
        range query: Query,
        from start: Date,
        to end: Date,
        step: Double,
        timeout: Double? = nil
    ) async throws -> [RangeQueryResponse] {
        let data = try await request("query_range", queryItems: [.query(query), .start(start), .end(end), .step(step), .timeout(timeout)])
        return try decodeQueryResponse(from: data, for: \.range)
            .map { .init(dimensions: $0.metric, values: $0.values.map { .init(date: $0.date, value: $0.value) }) }
    }

    // MARK: Helpers

    private func decodeQueryResponse<Content>(from data: Data, for keyPath: KeyPath<PrometheusQueryResponseContent, Content?>) throws -> Content {
        let content = try decodeResponse(ofType: PrometheusQueryResponseContent.self, from: data)
        guard let result = content[keyPath: keyPath] else { throw PrometheusProviderError.wrongResponseType(data) }
        return result
    }

    private func decodeResponse<Content: Decodable>(ofType content: Content.Type, from data: Data) throws -> Content {
        let response = try decoder.decode(PrometheusResponse<Content>.self, from: data)
        guard response.status == .success else { throw PrometheusProviderError.unsuccessfulResponse(data) }
        guard let content = response.content else { throw PrometheusProviderError.missingResponseContent(data) }
        return content
    }

    private func request(_ endpoint: String, queryItems: [QueryItem]) async throws -> Data {
        let url = baseURL
            .appendingPathComponent("api/v1")
            .appendingPathComponent(endpoint)

        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw PrometheusProviderError.couldNotEncodeQuery(url.absoluteString)
        }
        components.queryItems = queryItems.map { URLQueryItem(name: $0.keyRepresentation, value: $0.valueRepresentation) }

        guard let request = components.url.map({ URLRequest(url: $0) }) else {
            throw PrometheusProviderError.couldNotEncodeQuery(components.debugDescription)
        }

        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw PrometheusProviderError.failure(response, data)
        }

        return data
    }

}
