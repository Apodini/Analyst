
@available(macOS 12, *)
extension JaegerProvider {

    public func fetchServices() async throws -> [String] {
        let response = try await client
            .getServices(.with { _ in })
            .response
            .value
        return response.services
    }

}
