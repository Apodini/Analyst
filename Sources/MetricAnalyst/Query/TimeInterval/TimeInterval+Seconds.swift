
public struct SecondsTimeInterval: TimeInterval {

    public let count: Int

    public init(_ count: Int) {
        self.count = count
    }

}

extension TimeInterval where Self == SecondsTimeInterval {

    public static func seconds(_ count: Int) -> SecondsTimeInterval {
        .init(count)
    }

}
