
public struct MinutesTimeInterval: TimeInterval {

    public let count: Int

    public init(_ count: Int) {
        self.count = count
    }

}

extension TimeInterval where Self == MinutesTimeInterval {

    public static func minutes(_ count: Int) -> MinutesTimeInterval {
        .init(count)
    }

}
