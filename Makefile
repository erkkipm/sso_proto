APP_BIN =  gen/go/
APP_PROTO = proto/

.PHONY: gen
gen:
	rm -f $(APP_BIN)*
	protoc -I proto $(APP_PROTO)*.proto --go_out=./$(APP_BIN) --go_opt=paths=source_relative --go-grpc_out=./$(APP_BIN) --go-grpc_opt=paths=source_relative --experimental_allow_proto3_optional

