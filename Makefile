TOP=../..

webdoc: *.go
	@touch fail
	go vet
	golint
	go build
	@rm -f fail

clean:
	rm -rf webdoc ver.go fail doc
	@echo "*** CLEAN completed in webdoc ***"

test:
	@echo "*** TEST completed in webdoc ***"

all: clean webdoc test

# Example target that you can put in your source directory
# that contains the web service handling functions.
# Set WEBDOC=<path to webdoc directory>
webdocs:
	rm -rf doc
	${WEBDOC}
	@cp ${WEBDOCDIR}/doc.css doc/
	@cp ${WEBDOCDIR}/tester.html doc/
