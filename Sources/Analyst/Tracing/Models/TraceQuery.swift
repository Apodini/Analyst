
public struct TraceQuery {

    // MARK: Stored Properties

    public let service: String
    public let operation: String?
    public let tags: [Tag.Key: Tag.Value]
    public let minStartDate: Date?
    public let maxStartDate: Date?
    public let minDuration: TimeInterval?
    public let maxDuration: TimeInterval?
    public let maxCount: Int?

    // MARK: Initialization

    public init(service: String,
                operation: String? = nil,
                tags: [Tag.Key : Tag.Value] = [:],
                minStartDate: Date? = nil,
                maxStartDate: Date? = nil,
                minDuration: TimeInterval? = nil,
                maxDuration: TimeInterval? = nil,
                maxCount: Int? = nil) {

        self.service = service
        self.operation = operation
        self.tags = tags
        self.minStartDate = minStartDate
        self.maxStartDate = maxStartDate
        self.minDuration = minDuration
        self.maxDuration = maxDuration
        self.maxCount = maxCount
    }

}
