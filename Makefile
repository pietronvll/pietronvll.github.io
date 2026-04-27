.PHONY: cv site build preview deploy

cv:
	@command -v typst >/dev/null 2>&1 || { echo "typst is required for make cv"; exit 1; }
	typst compile cv/CV_Novelli.typ static/CV/CV_Novelli.pdf

site:
	uvx blag build

build: cv site

preview:
	uvx blag serve

deploy: build
	git add -A
	@if git diff --cached --quiet; then \
		echo "No changes to commit."; \
		exit 0; \
	fi
	git commit -m "$$(date +%d/%m/%Y) update"
	git push
