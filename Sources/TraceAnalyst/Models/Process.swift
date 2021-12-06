
public struct Process {

    // MARK: Stored Properties

    public let service: String
    public let tags: [Tag.Key: Tag.Value]

    // MARK: Initialization

    public init(service: String, tags: [Tag.Key: Tag.Value]) {
        self.service = service
        self.tags = tags
    }

}

// MARK: - CustomStringConvertible

extension Process: CustomStringConvertible {

    public var description: String {
        "Process(service: \"\(service)\", tags: \(tags))"
    }

}
