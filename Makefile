# Build a single-file prompt from modular sources.
# Output: prompt/PROMPT.full.md

PROMPT_DIR := prompt
OUT := PROMPT.full.md

# Keep this order stable for clean diffs
PARTS := \
  $(PROMPT_DIR)/system.md \
  $(PROMPT_DIR)/developer.md \
  $(PROMPT_DIR)/persona.md \
  $(PROMPT_DIR)/response-style.md

.PHONY: all build prompt clean check list

all: build

build: prompt

prompt: $(OUT)

$(OUT): $(PARTS)
	@mkdir -p $(PROMPT_DIR)
	@{ \
	  echo "<!-- GENERATED FILE: DO NOT EDIT DIRECTLY -->"; \
	  echo "<!-- Source order is defined in Makefile PARTS -->"; \
	  echo "<!-- Regenerate with: make prompt -->"; \
	  echo ""; \
	  for f in $(PARTS); do \
	    echo "<!-- BEGIN: $$f -->"; \
	    echo ""; \
	    cat "$$f"; \
	    echo ""; \
	    echo "<!-- END: $$f -->"; \
	    echo ""; \
	    echo "----"; \
	    echo ""; \
	  done; \
	} > "$(OUT)"
	@echo "Wrote $(OUT)"

list:
	@printf "%s\n" $(PARTS)

check:
	@set -e; \
	for f in $(PARTS); do \
	  test -f "$$f" || { echo "Missing file: $$f" >&2; exit 1; }; \
	done
	@echo "OK: all prompt parts exist"

clean:
	@rm -f "$(OUT)"
	@echo "Removed $(OUT)"
