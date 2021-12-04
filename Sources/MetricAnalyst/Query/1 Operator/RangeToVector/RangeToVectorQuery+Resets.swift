
public struct ResetsRangeToVectorOperator: RangeToVectorOperator {
    public init() {}
}

extension MetricQuery  {
    public static func resets<Query>(
        _ query: Query
    ) -> RangeToVectorQuery<Query, ResetsRangeToVectorOperator>
        where Self == RangeToVectorQuery<Query, ResetsRangeToVectorOperator> {
        .init(query: query, operator: .init())
    }
}
