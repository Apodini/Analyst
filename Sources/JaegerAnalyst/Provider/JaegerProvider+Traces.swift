
extension JaegerProvider {

    public func archive(id: UUID) -> EventLoopFuture<Void> {
        client
        .archiveTrace(.with { $0.traceID = Data(id.uuidString.utf8) })
        .response
        .map { _ in }
    }

    public func trace(id: UUID) -> EventLoopFuture<Trace> {
        var spans = [Span]()

        return client
            .getTrace(.with { $0.traceID = Data(id.uuidString.utf8) }) { chunk in
                spans.append(contentsOf: chunk.spans.compactMap(self.span))
            }
            .status
            .map { _ in
                Trace(spans: spans)
            }
    }

    public func traces(for query: TraceQuery) -> EventLoopFuture<[Trace]> {
        var traces = [Trace]()

        return client
            .findTraces(findTracesRequest(for: query)) { chunk in
                traces.append(
                    Trace(spans: chunk.spans.compactMap(self.span))
                )
            }
            .status
            .map { _ in traces }
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
