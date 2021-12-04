
public struct NaturalLogarithmVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func ln<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, NaturalLogarithmVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, NaturalLogarithmVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
