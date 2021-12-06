
public struct MetricVectorOperator<MetricType: Metric, Filter: DimensionFilter>: VectorOperator {

    public let metric: MetricType
    public let filter: Filter

    public init(metric: MetricType, filter: Filter) {
        self.metric = metric
        self.filter = filter
    }

}

extension MetricQuery {

    public static func metric<MetricType: Metric>(
        _ metric: MetricType
    ) -> VectorQuery<MetricVectorOperator<MetricType, AllDimensionFilter>>
        where Self == VectorQuery<MetricVectorOperator<MetricType, AllDimensionFilter>> {
        .init(operator: .init(metric: metric, filter: .init()))
    }

}

extension Metric {

    public func and<Filter: DimensionFilter>(filter: () -> Filter) -> VectorQuery<MetricVectorOperator<Self, Filter>> {
        .init(operator: .init(metric: self, filter: filter()))
    }

}
