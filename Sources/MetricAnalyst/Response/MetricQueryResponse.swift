
import struct Foundation.Date

public struct ScalarQueryResponse {

    public let date: Date
    public let value: Double

    public init(date: Date, value: Double) {
        self.date = date
        self.value = value
    }

}

public struct RangeQueryResponse {

    public let dimensions: [String: String]
    public let values: [ScalarQueryResponse]

    public init(dimensions: [String : String], values: [ScalarQueryResponse]) {
        self.dimensions = dimensions
        self.values = values
    }

}

public struct VectorQueryResponse {

    public let dimensions: [String: String]
    public let value: ScalarQueryResponse

    public init(dimensions: [String: String], value: ScalarQueryResponse) {
        self.dimensions = dimensions
        self.value = value
    }

}
