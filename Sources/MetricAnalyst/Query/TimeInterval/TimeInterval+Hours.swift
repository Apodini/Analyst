
public struct HoursTimeInterval: TimeInterval {

    public let count: Int

    public init(_ count: Int) {
        self.count = count
    }

}

extension TimeInterval where Self == HoursTimeInterval {

    public static func hours(_ count: Int) -> HoursTimeInterval {
        .init(count)
    }

}
