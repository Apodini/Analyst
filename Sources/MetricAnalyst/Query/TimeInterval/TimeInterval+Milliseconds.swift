
public struct MillisecondsTimeInterval: TimeInterval {

    public let count: Int

    public init(_ count: Int) {
        self.count = count
    }

}

extension TimeInterval where Self == MillisecondsTimeInterval {

    public static func milliseconds(_ count: Int) -> MillisecondsTimeInterval {
        .init(count)
    }

}
