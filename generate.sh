# Download the .proto files from GitHub
curl https://raw.githubusercontent.com/jaegertracing/jaeger-idl/master/proto/api_v2/query.proto \
    --output ./Sources/JaegerAnalyst/Generated/query.proto
curl https://raw.githubusercontent.com/jaegertracing/jaeger-idl/master/proto/api_v2/model.proto \
    --output ./Sources/JaegerAnalyst/Generated/model.proto

# Download the imports:
mkdir ./Sources/JaegerAnalyst/Generated/gogoproto
curl https://raw.githubusercontent.com/gogo/protobuf/master/gogoproto/gogo.proto \
    --output ./Sources/JaegerAnalyst/Generated/gogoproto/gogo.proto
    
mkdir ./Sources/JaegerAnalyst/Generated/google
mkdir ./Sources/JaegerAnalyst/Generated/google/api
curl https://raw.githubusercontent.com/googleapis/googleapis/master/google/api/annotations.proto \
    --output ./Sources/JaegerAnalyst/Generated/google/api/annotations.proto
curl https://raw.githubusercontent.com/googleapis/googleapis/master/google/api/http.proto \
    --output ./Sources/JaegerAnalyst/Generated/google/api/http.proto

# Run the protobuf compiler
protoc ./Sources/JaegerAnalyst/Generated/query.proto \
    --proto_path=./Sources/JaegerAnalyst/Generated \
    --swift_out=./Sources/JaegerAnalyst/Generated \
    --grpc-swift_out=./Sources/JaegerAnalyst/Generated

protoc ./Sources/JaegerAnalyst/Generated/model.proto \
    --proto_path=./Sources/JaegerAnalyst/Generated \
    --swift_out=./Sources/JaegerAnalyst/Generated \
    --grpc-swift_out=./Sources/JaegerAnalyst/Generated
