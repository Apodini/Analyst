
public struct ChangesRangeToVectorOperator: RangeToVectorOperator {
    public init() {}
}

extension MetricQuery  {

    public static func changes<Query: RangeMetricQuery>(
        _ query: Query
    ) -> RangeToVectorQuery<Query, ChangesRangeToVectorOperator>
        where Self == RangeToVectorQuery<Query, ChangesRangeToVectorOperator> {
        .init(query: query, operator: .init())
    }

}
