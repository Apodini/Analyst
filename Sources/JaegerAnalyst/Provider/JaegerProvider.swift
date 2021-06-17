
public final class JaegerProvider: TraceProvider {
    public typealias Process = Analyst.Process

    // MARK: Stored Properties

    let client: JaegerClientProtocol

    // MARK: Initialization

    public init(channel: GRPCChannel) {
        self.client = JaegerClient(channel: channel)
    }

}
