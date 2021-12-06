
struct PrometheusVector: Decodable {
    let metric: [String: String]
    let value: PrometheusScalar
}
