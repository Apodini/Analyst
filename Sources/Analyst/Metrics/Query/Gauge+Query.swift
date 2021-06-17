extension Gauge {

    public func delta(in interval: Interval) -> ScalarQuery<Gauge> {
        query(scalar: .delta(self[interval]))
    }

    public func average() -> ScalarQuery<Self> {
        query(scalar: .sum(.metric(self)))
    }

    public func min() -> ScalarQuery<Self> {
        query(scalar: .min(.metric(self)))
    }

    public func max() -> ScalarQuery<Self> {
        query(scalar: .max(.metric(self)))
    }

    public func sum() -> ScalarQuery<Self> {
        query(scalar: .sum(.metric(self)))
    }

    public func count() -> ScalarQuery<Self> {
        query(scalar: .count(.metric(self)))
    }

    public func deviation() -> ScalarQuery<Self> {
        query(scalar: .deviation(.metric(self)))
    }

    public func variance() -> ScalarQuery<Self> {
        query(scalar: .variance(.metric(self)))
    }

}
