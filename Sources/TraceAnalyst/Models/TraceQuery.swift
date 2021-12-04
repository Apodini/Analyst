
import Foundation

public struct TraceQuery {

    // MARK: Stored Properties

    public let service: String
    public let operation: String?
    public let tags: [Tag.Key: Tag.Value]
    public let minStartDate: Date?
    public let maxStartDate: Date?
    public let minDuration: Double?
    public let maxDuration: Double?
    public let maxCount: Int?

    // MARK: Initialization

    public init(service: String,
                operation: String? = nil,
                tags: [Tag.Key : Tag.Value] = [:],
                minStartDate: Date? = nil,
                maxStartDate: Date? = nil,
                minDuration: Double? = nil,
                maxDuration: Double? = nil,
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
