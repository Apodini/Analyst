public struct RecorderScalarResult {

    public var label: String
    public var dimensions: [String: String]
    public var date: Date
    public var buckets: [Double: Double]

    public init(label: String, dimensions: [String: String], date: Date, buckets: [Double: Double]) {
        self.label = label
        self.dimensions = dimensions
        self.date = date
        self.buckets = buckets
    }

}
