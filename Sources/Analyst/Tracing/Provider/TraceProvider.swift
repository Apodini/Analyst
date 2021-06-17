
public protocol TraceProvider {

    // MARK: Traces

    func archive(id: UUID) -> EventLoopFuture<Void>
    func trace(id: UUID) -> EventLoopFuture<Trace>
    func traces(for query: TraceQuery) -> EventLoopFuture<[Trace]>

    // MARK: Others

    func dependencies(from: Date?, to: Date?) -> EventLoopFuture<[Dependency]>
    func operations(service: String, kind: String?) -> EventLoopFuture<[Operation]>
    func services() -> EventLoopFuture<[String]>

}

extension TraceProvider {

    public func dependencies(from date: Date) -> EventLoopFuture<[Dependency]> {
        dependencies(from: date, to: nil)
    }

    public func dependencies(to date: Date) -> EventLoopFuture<[Dependency]> {
        dependencies(from: nil, to: date)
    }

    public func dependencies() -> EventLoopFuture<[Dependency]> {
        dependencies(from: nil, to: nil)
    }

    public func operations(service: String) -> EventLoopFuture<[Operation]> {
        operations(service: service, kind: nil)
    }

}
