
public struct Base10LogarithmVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func log10<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, Base10LogarithmVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, Base10LogarithmVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
