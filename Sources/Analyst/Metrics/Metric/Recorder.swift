public struct Recorder: Metric {

    public let information: MetricInformation

    public init(label: String, dimensions: [String: String] = [:]) {
        self.information = .init(label: label, dimensions: dimensions)
    }

}
