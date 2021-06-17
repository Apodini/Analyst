extension Counter {

    public func rateAverage(in interval: Interval) -> ScalarQuery<Self> {
        query(scalar: .average(.rate(self[interval])))
    }

    public func rateMinimum(in interval: Interval) -> ScalarQuery<Self> {
        query(scalar: .min(.rate(self[interval])))
    }

    public func rateMaximum(in interval: Interval) -> ScalarQuery<Self> {
        query(scalar: .max(.rate(self[interval])))
    }

    public func rateSum(in interval: Interval) -> ScalarQuery<Self> {
        query(scalar: .sum(.rate(self[interval])))
    }

    public func rateCount(in interval: Interval) -> ScalarQuery<Self> {
        query(scalar: .count(.rate(self[interval])))
    }

    public func rateDeviation(in interval: Interval) -> ScalarQuery<Self> {
        query(scalar: .deviation(.rate(self[interval])))
    }

    public func rateVariance(in interval: Interval) -> ScalarQuery<Self> {
        query(scalar: .variance(.rate(self[interval])))
    }

}
