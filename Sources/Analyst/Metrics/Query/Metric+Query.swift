extension Metric {

    public func query(range kind: RangeQuery<Self>.Kind) -> RangeQuery<Self> {
        .init(label: information.label, kind: kind)
    }

    public func query(range kind: RangeQuery<Self>) -> RangeQuery<Self> {
        .init(label: information.label, kind: kind.kind)
    }

    public func query(vector kind: VectorQuery<Self>.Kind) -> VectorQuery<Self> {
        .init(label: information.label, kind: kind)
    }

    public func query(vector kind: VectorQuery<Self>) -> VectorQuery<Self> {
        .init(label: information.label, kind: kind.kind)
    }

    public func query(scalar kind: ScalarQuery<Self>.Kind, in time: TimeRange) -> RangeQuery<Self> {
        .init(label: information.label, kind: .matrix(kind, time))
    }

    public func query(scalar kind: ScalarQuery<Self>, in time: TimeRange) -> RangeQuery<Self> {
        .init(label: information.label, kind: .matrix(kind.kind, time))
    }

    public func query(scalar kind: ScalarQuery<Self>.Kind) -> ScalarQuery<Self> {
        .init(label: information.label, kind: kind)
    }

    public func query(scalar kind: ScalarQuery<Self>) -> ScalarQuery<Self> {
        .init(label: information.label, kind: kind.kind)
    }

    public subscript(interval: Interval) -> RangeQuery<Self>.Kind {
        .range(self, in: interval)
    }

    public func value() -> ScalarQuery<Self> {
        query(scalar: .metric(self))
    }

}
