
public struct Trace {

    // MARK: Stored Properties

    public let spans: [Span]

    // MARK: Initialization

    public init(spans: [Span]) {
        self.spans = spans
    }

}

// MARK: - CustomStringConvertible

extension Trace: CustomStringConvertible {

    public var description: String {
        "Trace(spans: \(spans))"
    }

}
