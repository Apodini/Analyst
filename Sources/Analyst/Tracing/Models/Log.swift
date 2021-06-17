
public struct Log: Equatable {

    // MARK: Stored Properties

    public let date: Date
    public let tags: [Tag.Key: Tag.Value]

    // MARK: Initialization

    public init(date: Date, tags: [Tag.Key: Tag.Value]) {
        self.date = date
        self.tags = tags
    }

}

// MARK: - CustomStringConvertible

extension Log: CustomStringConvertible {

    public var description: String {
        "Log(date: \(date), tags: \(tags))"
    }

}
