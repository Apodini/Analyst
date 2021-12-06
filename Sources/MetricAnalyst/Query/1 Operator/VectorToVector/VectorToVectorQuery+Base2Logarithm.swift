
public struct Base2LogarithmVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func log2<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, Base2LogarithmVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, Base2LogarithmVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
