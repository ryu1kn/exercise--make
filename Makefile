
build-dir := build
util-dir := tools

secret_names = $(basename $(notdir $(wildcard secrets/$(ENV_NAME)/*)))

$(shell mkdir -p $(build-dir)/{manifests,secrets})

# $(build-dir)/my-app.yaml: ...
#	...

.PHONY: clean
clean:
	rm -rf $(build-dir)

.PHONY: test
test: $(build-dir)/my-app.yaml
	diff expected-my-app.yaml $<
	@echo "Passed! 👍"
