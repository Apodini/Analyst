
import AsyncHTTPClient

public class Prometheus: MetricProvider {
    public typealias Timer = Analyst.Timer

    // MARK: Nested Types

    enum Error: Swift.Error {
        case failure(HTTPClient.Response)
        case missingBody(HTTPClient.Response)
        case couldNotEncodeQuery(String)
    }

    // MARK: Stored Properties

    public let baseURL: URL
    public let client: HTTPClient

    // MARK: Initialization

    public init(baseURL: URL, client: HTTPClient) {
        self.baseURL = baseURL
        self.client = client
    }

    deinit {
        try? client.syncShutdown()
    }

    // MARK: Methods

    public func results(unsafeQuery: String) -> EventLoopFuture<Data> {
        results(for: unsafeQuery)
    }

    public func results(for query: ScalarQuery<Counter>) -> EventLoopFuture<VectorResult<CounterScalarResult>> {
        results(for: query.kind.stringValue)
        .flatMapThrowing { data in
            try JSONDecoder().decode(VectorResponse.self, from: data)
            .counter(label: query.label)
        }
    }

    public func results(for query: ScalarQuery<Gauge>) -> EventLoopFuture<VectorResult<GaugeScalarResult>> {
        results(for: query.kind.stringValue)
        .flatMapThrowing { data in
            try JSONDecoder().decode(VectorResponse.self, from: data)
            .gauge(label: query.label)
        }
    }

    public func results(for query: ScalarQuery<Recorder>) -> EventLoopFuture<VectorResult<RecorderScalarResult>> {
        results(for: query.kind.stringValue)
        .flatMapThrowing { data in
            try JSONDecoder().decode(VectorResponse.self, from: data)
            .recorder(label: query.label)
        }
    }

    public func results(for query: ScalarQuery<Timer>) -> EventLoopFuture<VectorResult<TimerScalarResult>> {
        results(for: query.kind.stringValue)
        .flatMapThrowing { data in
            try JSONDecoder().decode(VectorResponse.self, from: data)
            .timer(label: query.label)
        }
    }

    public func results(for query: VectorQuery<Counter>) -> EventLoopFuture<VectorResult<CounterScalarResult>> {
        results(for: query.kind.stringValue)
        .flatMapThrowing { data in
            try JSONDecoder().decode(VectorResponse.self, from: data)
            .counter(label: query.label)
        }
    }

    public func results(for query: VectorQuery<Gauge>) -> EventLoopFuture<VectorResult<GaugeScalarResult>> {
        results(for: query.kind.stringValue)
        .flatMapThrowing { data in
            try JSONDecoder().decode(VectorResponse.self, from: data)
            .gauge(label: query.label)
        }
    }

    public func results(for query: VectorQuery<Recorder>) -> EventLoopFuture<VectorResult<RecorderScalarResult>> {
        results(for: query.kind.stringValue)
        .flatMapThrowing { data in
            try JSONDecoder().decode(VectorResponse.self, from: data)
            .recorder(label: query.label)
        }
    }

    public func results(for query: VectorQuery<Timer>) -> EventLoopFuture<VectorResult<TimerScalarResult>> {
        results(for: query.kind.stringValue)
        .flatMapThrowing { data in
            try JSONDecoder().decode(VectorResponse.self, from: data)
            .timer(label: query.label)
        }
    }

    public func results(for query: RangeQuery<Counter>) -> EventLoopFuture<[RangeResult]> {
        results(for: query.kind.stringValue)
        .flatMapThrowing { data in
            try JSONDecoder().decode(VectorResponse.self, from: data)
            .rangeResults(label: query.label)
        }
    }

    public func results(for query: RangeQuery<Gauge>) -> EventLoopFuture<[RangeResult]> {
        results(for: query.kind.stringValue)
        .flatMapThrowing { data in
            try JSONDecoder().decode(VectorResponse.self, from: data)
            .rangeResults(label: query.label)
        }
    }

    public func results(for query: RangeQuery<Recorder>) -> EventLoopFuture<[RangeResult]> {
        results(for: query.kind.stringValue)
        .flatMapThrowing { data in
            try JSONDecoder().decode(VectorResponse.self, from: data)
            .rangeResults(label: query.label)
        }
    }

    public func results(for query: RangeQuery<Timer>) -> EventLoopFuture<[RangeResult]> {
        results(for: query.kind.stringValue)
        .flatMapThrowing { data in
            try JSONDecoder().decode(VectorResponse.self, from: data)
            .rangeResults(label: query.label)
        }
    }

    // MARK: Helpers

    private func results(for query: String) -> EventLoopFuture<Data> {
        print(#function, query)
        guard let queryString = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return client.eventLoopGroup.next()
                .makeFailedFuture(Error.couldNotEncodeQuery(query))
        }
        var url = baseURL.appendingPathComponent("api/v1/query").absoluteString
        url.append(contentsOf: "?query=" + queryString)

        return client.get(url: url)
            .flatMapThrowing { response in

                guard let body = response.body else {
                    throw Error.missingBody(response)
                }

                let data = Data(buffer: body)
                print(String(data: data, encoding: .utf8) ?? "nil")

                guard response.status == .ok else {
                    throw Error.failure(response)
                }

                return data
            }

    }

}
