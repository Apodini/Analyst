
extension JaegerProvider {

    public func operations(service: String, kind: String?) -> EventLoopFuture<[Analyst.Operation]> {
        client
        .getOperations(
            .with {
                $0.service = service
                if let kind = kind {
                    $0.spanKind = kind
                }
            }
        )
        .response
        .map { response in
            response.operations.map { operation in
                .init(
                    name: operation.name,
                    kind: operation.spanKind
                )
            }
        }
    }

}
