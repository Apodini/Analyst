
public struct IDeltaRangeToVectorOperator: RangeToVectorOperator {
    public init() {}
}

extension MetricQuery  {
    public static func idelta<Query>(
        _ query: Query
    ) -> RangeToVectorQuery<Query, IDeltaRangeToVectorOperator>
        where Self == RangeToVectorQuery<Query, IDeltaRangeToVectorOperator> {
        .init(query: query, operator: .init())
    }
}
