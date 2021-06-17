
extension JaegerProvider {

    public func services() -> EventLoopFuture<[String]> {
        client
        .getServices(.with { _ in })
        .response
        .map { $0.services }
    }

}
