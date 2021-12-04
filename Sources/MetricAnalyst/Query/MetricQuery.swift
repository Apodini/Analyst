
public protocol MetricQuery {}
public protocol ScalarMetricQuery: MetricQuery {}
public protocol VectorMetricQuery: MetricQuery {}
public protocol RangeMetricQuery: MetricQuery {}

public protocol MetricQueryOperator {}
public protocol NullaryMetricQueryOperator: MetricQueryOperator {}
public protocol UnaryMetricQueryOperator: MetricQueryOperator {}
public protocol BinaryMetricQueryOperator: MetricQueryOperator {}

public protocol NullaryOperatorMetricQuery: MetricQuery {
    associatedtype Operator: NullaryMetricQueryOperator

    var `operator`: Operator { get }
}
public protocol UnaryOperatorMetricQuery: MetricQuery {
    associatedtype Query: MetricQuery
    associatedtype Operator: UnaryMetricQueryOperator

    var query: Query { get }
    var `operator`: Operator { get }
}
public protocol BinaryOperatorMetricQuery: MetricQuery {
    associatedtype Left: MetricQuery
    associatedtype Operator: BinaryMetricQueryOperator
    associatedtype Right: MetricQuery

    var left: Left { get }
    var `operator`: Operator { get }
    var right: Right { get }
}
