
import SwiftProtobuf

extension JaegerProvider {

    public func dependencies(from startDate: Date?, to endDate: Date?) -> EventLoopFuture<[Dependency]> {
        client
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
        .map { response in
            response.dependencies.map { dependency in
                Dependency(
                    parent: dependency.parent,
                    child: dependency.child,
                    callCount: Int(dependency.callCount),
                    source: dependency.source
                )
            }
        }
    }

}
