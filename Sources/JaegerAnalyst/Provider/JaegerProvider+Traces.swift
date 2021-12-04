
import Foundation

@available(macOS 12, *)
extension JaegerProvider {

    public func archive(id: UUID) async throws {
        _ = try await client
            .archiveTrace(.with { $0.traceID = Data(id.uuidString.utf8) })
            .response
            .value
    }

    public func fetchTrace(id: UUID) async throws -> Trace {
        var spans = [Span]()

        _ = try await client
            .getTrace(.with { $0.traceID = Data(id.uuidString.utf8) }) { chunk in
                spans.append(contentsOf: chunk.spans.compactMap(self.span))
            }
            .status
            .value

        return Trace(spans: spans)
    }

    public func fetchTraces(for query: TraceQuery) async throws -> [Trace] {
        var traces = [Trace]()

        _ = try await client
            .findTraces(findTracesRequest(for: query)) { chunk in
                traces.append(
                    Trace(spans: chunk.spans.compactMap(self.span))
                )
            }
            .status
            .value

        return traces
    }

}

// MARK: - Helpers

extension JaegerProvider {

    private func findTracesRequest(for query: TraceQuery) -> JaegerFindTracesRequest {
        .with { request in
            request.query = .with { newQuery in

                newQuery.serviceName = query.service

                if let operationName = query.operation {
                    newQuery.operationName = operationName
                }

                if let minStartTime = query.minStartDate {
                    newQuery.startTimeMin = .init(date: minStartTime)
                }

                if let maxStartTime = query.maxStartDate {
                    newQuery.startTimeMax = .init(date: maxStartTime)
                }

                if let minDuration = query.minDuration {
                    newQuery.durationMin = .init(timeInterval: minDuration)
                }

                if let maxDuration = query.maxDuration {
                    newQuery.durationMax = .init(timeInterval: maxDuration)
                }

                if let searchDepth = query.maxCount {
                    newQuery.searchDepth = Int32(searchDepth)
                }

                newQuery.tags = query.tags.mapValues { $0.stringValue }

            }
        }
    }

}
