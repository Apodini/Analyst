
extension Timer {

    public func average(in time: Interval) -> ScalarQuery<Self> {
        query(scalar: .sum(.rate(self[time])) / .count(.rate(self[time])))
    }

    public func average(in time: TimeRange) -> RangeQuery<Self> {
        query(scalar: average(in: time.step).kind, in: time)
    }

}
