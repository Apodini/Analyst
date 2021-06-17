public struct TimerScalarResult {

    public var label: String
    public var dimensions: [String: String]
    public var date: Date
    public var quantiles: [Double: Double]

    public init(label: String, dimensions: [String: String], date: Date, quantiles: [Double: Double]) {
        self.label = label
        self.dimensions = dimensions
        self.date = date
        self.quantiles = quantiles
    }

}
