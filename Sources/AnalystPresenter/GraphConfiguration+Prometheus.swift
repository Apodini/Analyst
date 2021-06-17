
public struct PrometheusGraphConfiguration: GraphConfiguration {

    public let styles: [(Chart.Style, Color)]

    public init(styles: [(Chart.Style, Color)]) {
        assert(!styles.isEmpty)
        self.styles = styles
    }

    public func dataSet(for result: RangeResult, normalizedIn range: ClosedRange<Double>) -> Graph.DataSet {
        let data = result.values.sorted(by: { $0.key < $1.key }).map { range.normalize($0.value) }
        let title = self.title(for: result)
        let index = ((title.hashValue % styles.count) + styles.count) % styles.count
        let style = styles[index]
        return .init(
            title: title,
            color: ColorCode(style.1),
            data: data,
            style: style.0
        )
    }

    private func title(for result: RangeResult) -> String {
        guard !result.dimensions.isEmpty else { return result.label }
        let dimensions = result.dimensions.map { "\($0)=\"\($1)\"" }.joined(separator: ", ")
        return result.label + "{" + dimensions + "}"
    }

    public func dateLabels(in range: ClosedRange<Date>) -> [Graph.Label] {
        func string(for date: Date) -> String {
            let timeInterval = -date.timeIntervalSinceNow

            let days = Int(timeInterval / (24 * 60 * 60))
            guard days < 2 else {
                return "\(days) days ago"
            }

            let hours = Int(timeInterval / (60 * 60))
            guard hours < 2 else {
                return "\(hours) hours ago"
            }

            let minutes = Int(timeInterval / 60)
            guard minutes < 2 else {
                return "\(minutes) min ago"
            }

            let seconds = Int(timeInterval)
            guard seconds < 2 else {
                return "\(seconds) s ago"
            }

            let milliseconds = Int(timeInterval * 1000)
            guard milliseconds < 2 else {
                return "\(milliseconds) ms ago"
            }

            let microseconds = Int(timeInterval * 1_000_000)
            guard microseconds > 2 else {
                return "\(microseconds) µs ago"
            }

            return String(format: "%.1f", timeInterval * 1_000_000_000) + " ns ago"
        }

        return [
            Graph.Label(
                text: string(for: range.upperBound),
                value: 1
            ),
            Graph.Label(
                text: string(for: range.lowerBound),
                value: 0
            )
        ]
    }

    public func valueLabels(in range: ClosedRange<Double>) -> [Graph.Label] {
        let formatter = NumberFormatter()
        return (0..<4).map { index in
            let ratio = (Double(index) + 0.5) / 4
            let value = range.value(atPercentage: ratio)
            return Graph.Label(
                text: formatter.string(from: value as NSNumber) ?? "",
                value: CGFloat(ratio)
            )
        }
    }

}
