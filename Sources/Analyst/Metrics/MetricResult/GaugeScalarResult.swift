public struct GaugeScalarResult {

    public var label: String
    public var dimensions: [String: String]
    public var date: Date
    public var value: Double

    public init(label: String, dimensions: [String: String], date: Date, value: Double) {
        self.label = label
        self.dimensions = dimensions
        self.date = date
        self.value = value
    }

}
