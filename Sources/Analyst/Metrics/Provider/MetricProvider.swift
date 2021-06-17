public protocol MetricProvider {

    func results(for query: ScalarQuery<Counter>) -> EventLoopFuture<VectorResult<CounterScalarResult>>
    func results(for query: ScalarQuery<Gauge>) -> EventLoopFuture<VectorResult<GaugeScalarResult>>
    func results(for query: ScalarQuery<Recorder>) -> EventLoopFuture<VectorResult<RecorderScalarResult>>
    func results(for query: ScalarQuery<Timer>) -> EventLoopFuture<VectorResult<TimerScalarResult>>

    func results(for query: VectorQuery<Counter>) -> EventLoopFuture<VectorResult<CounterScalarResult>>
    func results(for query: VectorQuery<Gauge>) -> EventLoopFuture<VectorResult<GaugeScalarResult>>
    func results(for query: VectorQuery<Recorder>) -> EventLoopFuture<VectorResult<RecorderScalarResult>>
    func results(for query: VectorQuery<Timer>) -> EventLoopFuture<VectorResult<TimerScalarResult>>

    func results(for query: RangeQuery<Counter>) -> EventLoopFuture<[RangeResult]>
    func results(for query: RangeQuery<Gauge>) -> EventLoopFuture<[RangeResult]>
    func results(for query: RangeQuery<Recorder>) -> EventLoopFuture<[RangeResult]>
    func results(for query: RangeQuery<Timer>) -> EventLoopFuture<[RangeResult]>

}
