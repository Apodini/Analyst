
public struct YearsTimeInterval: TimeInterval {

    public let count: Int

    public init(_ count: Int) {
        self.count = count
    }

}

extension TimeInterval where Self == YearsTimeInterval {

    public static func years(_ count: Int) -> YearsTimeInterval {
        .init(count)
    }

}
