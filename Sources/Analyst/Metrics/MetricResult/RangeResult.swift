public struct RangeResult {

    public var label: String
    public var dimensions: [String: String]
    public var values: [Date: Double]

    public init(label: String, dimensions: [String: String], values: [Date: Double]) {
        self.label = label
        self.dimensions = dimensions
        self.values = values
    }

}
