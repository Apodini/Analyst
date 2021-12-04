
public struct DaysTimeInterval: TimeInterval {

    public let count: Int

    public init(_ count: Int) {
        self.count = count
    }

}

extension TimeInterval where Self == DaysTimeInterval {

    public static func days(_ count: Int) -> DaysTimeInterval {
        .init(count)
    }

}
