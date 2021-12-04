
public struct FloorVectorToVectorOperator: VectorToVectorOperator {
    public init() {}
}

extension MetricQuery {

    public static func floor<Query: VectorMetricQuery>(
        _ query: Query
    ) -> VectorToVectorQuery<Query, FloorVectorToVectorOperator>
        where Self == VectorToVectorQuery<Query, FloorVectorToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
