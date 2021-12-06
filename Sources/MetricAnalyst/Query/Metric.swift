
public protocol Metric: AnyObject, VectorMetricQuery {
    var label: String { get }
    var dimensions: [(String, String)] { get }
}

extension Counter: Metric {}
extension FloatingPointCounter: Metric {}
extension Recorder: Metric {}
extension Timer: Metric {}
