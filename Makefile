# Build the docs for the proto3 definition.

bindings:
	protoc proto/com/iab/adcom/adcom.proto --java_out=java --go_out=go

check:
	prototool lint

clean:
	rm -fr java/com && \
	rm -fr go/proto

docs:
	docker run --rm \
  -v ${PWD}/doc:/out \
  -v ${PWD}/:/protos \
  pseudomuto/protoc-gen-doc --doc_opt=markdown,README.md \
	proto/com/iab/adcom/adcom.proto \
	proto/com/iab/adcom/context/context.proto \
	proto/com/iab/adcom/media/media.proto \
	proto/com/iab/adcom/placement/placement.proto

watch:
	fswatch  -r ./proto/ | xargs -n1 make docs
