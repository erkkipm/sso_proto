GEN_DIR = ./gen/go/
PROTO_DIR = ./proto/

.PHONY: gen
gen:
	@go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	@go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	@export PATH="$PATH:$(go env GOPATH)/bin"
	@echo "======= Генерация кода ========"
	@protoc --version
	@rm -rf $(GEN_DIR)
	@mkdir -p $(GEN_DIR)
	@protoc -I $(PROTO_DIR) $(PROTO_DIR)*.proto \
			--go_out=$(GEN_DIR) --go_opt=paths=source_relative \
	       	  --go-grpc_out=$(GEN_DIR) --go-grpc_opt=paths=source_relative \
	        --experimental_allow_proto3_optional \
	       && echo " ✅  Код сгенерирован!" || echo " ❌  Код не сгенерирован!"