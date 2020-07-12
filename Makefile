# Load .env file if existing
-include .env
export

.PHONY: serve run
serve run:
	zola serve

.PHONY: purge
purge:
	curl -X POST "https://api.cloudflare.com/client/v4/zones/$(ZONE)/purge_cache" \
	 -H "X-Auth-Email: $(MAIL)" \
	 -H "X-Auth-Key: $(KEY)" \
	 -H "Content-Type: application/json" \
	 --data '{"purge_everything":true}'