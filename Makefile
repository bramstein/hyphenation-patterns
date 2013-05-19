.PHONY : all clean publish

patterns := $(wildcard patterns/*.js)

all: $(patterns)

publish:
	for language in `ls dist/npm/` ; do (cd dist/npm/$$language; npm publish) ; done

$(patterns):: lib/patterns.browser.pre.js lib/patterns.browser.post.js
	@mkdir -p dist/browser/
	cat lib/patterns.browser.pre.js $@ lib/patterns.browser.post.js > dist/browser/$(@F)
	@mkdir -p dist/npm/$(basename $(@F))/lib
	sed 's/{language}/$(basename $(@F))/g' lib/ender.js > dist/npm/$(basename $(@F))/lib/ender.js
	cat $@ > dist/npm/$(basename $(@F))/lib/$(@F)
	sed 's/{language}/$(basename $(@F))/g' lib/package.json > dist/npm/$(basename $(@F))/package.json

clean:
	rm -rf dist
