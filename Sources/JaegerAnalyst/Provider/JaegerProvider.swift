
public final class JaegerProvider: TraceProvider {

    // MARK: Stored Properties

    let client: JaegerClientProtocol

    // MARK: Initialization

    public init(channel: GRPCChannel) {
        self.client = JaegerClient(channel: channel)
    }

}
