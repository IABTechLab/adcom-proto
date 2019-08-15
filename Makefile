# Build the docs for the proto3 definition.

bindings:
	protoc --proto_path proto proto/com/iabtechlab/adcom/adcom.proto --java_out=java --go_out=go

check:
	cd proto/ && prototool lint 

clean:
	rm -fr java/com && \
	rm -fr go/proto

docs:
	docker run --rm \
  -v ${PWD}/doc:/out \
  -v ${PWD}/proto:/protos \
  pseudomuto/protoc-gen-doc --doc_opt=markdown,README.md \
	com/iabtechlab/adcom/adcom.proto \
	com/iabtechlab/adcom/enums/enums.proto \
	com/iabtechlab/adcom/context/context.proto \
	com/iabtechlab/adcom/media/media.proto \
	com/iabtechlab/adcom/placement/placement.proto

watch:
	fswatch  -r ./proto/ | xargs -n1 make docs

list_enums:
	@awk '/enum .* \{/{ print $$2 }' proto/com/iabtechlab/adcom/enums/enums.proto

list_enum_usages:
	@for e in `make list_enums`; do echo "$$e" ; grep --exclude-dir=".git" --exclude="enums.proto" -rnl $$e proto | xargs basename ; echo; done
