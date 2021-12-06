
public struct DimensionFilterVectorOperator<Filter: DimensionFilter>: VectorOperator {

    public let label: String?
    public let filter: Filter

    public init(label: String?, filter: Filter) {
        self.filter = filter
        self.label = label
    }

}

extension MetricQuery {

    public static func metric(
        _ label: String? = nil
    ) -> VectorQuery<DimensionFilterVectorOperator<AllDimensionFilter>>
        where Self == VectorQuery<DimensionFilterVectorOperator<AllDimensionFilter>> {
            .init(operator: .init(label: label, filter: .init()))
    }

    public static func metric<Filter: DimensionFilter>(
        _ label: String? = nil,
        filter: () -> Filter
    ) -> VectorQuery<DimensionFilterVectorOperator<Filter>>
        where Self == VectorQuery<DimensionFilterVectorOperator<Filter>> {
            .init(operator: .init(label: label, filter: filter()))
    }

}

extension String: VectorMetricQuery {

    public func `where`<Filter: DimensionFilter>(filter: () -> Filter) -> VectorQuery<DimensionFilterVectorOperator<Filter>> {
        .init(operator: .init(label: self, filter: filter()))
    }

}
