
public struct WeeksTimeInterval: TimeInterval {

    public let count: Int

    public init(_ count: Int) {
        self.count = count
    }

}

extension TimeInterval where Self == WeeksTimeInterval {

    public static func weeks(_ count: Int) -> WeeksTimeInterval {
        .init(count)
    }

}
