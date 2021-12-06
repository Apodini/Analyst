
@available(macOS 12, *)
extension JaegerProvider {

    public func fetchOperations(service: String, kind: String?) async throws -> [Operation] {
        let response = try await client
            .getOperations(
                .with {
                    $0.service = service
                    if let kind = kind {
                        $0.spanKind = kind
                    }
                }
            )
            .response
            .value

        return response.operations.map { operation in
                .init(
                    name: operation.name,
                    kind: operation.spanKind
                )
        }
    }

}
