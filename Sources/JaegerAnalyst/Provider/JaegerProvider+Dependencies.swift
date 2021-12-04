
import Foundation
import SwiftProtobuf

@available(macOS 12, *)
extension JaegerProvider {

    public func fetchDependencies(
        from startDate: Date?,
        to endDate: Date?
    ) async throws -> [Dependency] {

        let response = try await client
            .getDependencies(
                .with {
                    if let startDate = startDate {
                        $0.startTime = .init(date: startDate)
                    }
                    if let endDate = endDate {
                        $0.endTime = .init(date: endDate)
                    }
                }
            )
            .response
            .value

        return response.dependencies.map { dependency in
            Dependency(
                parent: dependency.parent,
                child: dependency.child,
                callCount: Int(dependency.callCount),
                source: dependency.source
            )
        }
    }

}
