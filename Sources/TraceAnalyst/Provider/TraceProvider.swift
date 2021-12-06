
import Foundation

@available(macOS 12, iOS 15, *)
public protocol TraceProvider {

    // MARK: Traces

    func archive(id: UUID) async throws
    func fetchTrace(id: UUID) async throws -> Trace
    func fetchTraces(for query: TraceQuery) async throws -> [Trace]

    // MARK: Others

    func fetchDependencies(from: Date?, to: Date?) async throws -> [Dependency]
    func fetchOperations(service: String, kind: String?) async throws -> [Operation]
    func fetchServices() async throws -> [String]

}

@available(macOS 12, iOS 15, *)
extension TraceProvider {

    public func fetchDependencies(from date: Date) async throws -> [Dependency] {
        try await fetchDependencies(from: date, to: nil)
    }

    public func fetchDependencies(to date: Date) async throws -> [Dependency] {
        try await fetchDependencies(from: nil, to: date)
    }

    public func fetchDependencies() async throws -> [Dependency] {
        try await fetchDependencies(from: nil, to: nil)
    }

    public func fetchOperations(service: String) async throws -> [Operation] {
        try await fetchOperations(service: service, kind: nil)
    }

}
