BRANCH=`git rev-parse --abbrev-ref HEAD`
COMMIT=`git rev-parse --short HEAD`
GOLDFLAGS="-X main.branch $(BRANCH) -X main.commit $(COMMIT)"

PROGRAM=rserver

$(PROGRAM):
	@go build -v -o $@

clean:
	$(RM) $(PROGRAM)

test:
	@go test -v ./util/

tar:
	@rm -f app.gz.tar rserver
	@tar -vzcf app.gz.tar *

install:
	@mv ./rserver /usr/local/bin

.PHONY: tar
