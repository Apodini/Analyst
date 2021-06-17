
extension Recorder {

    public func quantile(_ value: Double, in scalar: ScalarQuery<Self>.Kind) -> ScalarQuery<Self> {
        query(scalar: .aggregation(.quantile(value), scalar, nil))
    }

}
