.PHONY : all clean

patterns := $(wildcard patterns/*.js)
browser := $(wildcard patterns/*.js)
publish := en-us nl

all: $(patterns) $(browser)

$(patterns):: lib/package.json 
	@mkdir -p dist/npm/$(basename $(@F))/lib
	cat $@ > dist/npm/$(basename $(@F))/lib/$(@F) 
	sed 's/{language}/$(basename $(@F))/g' lib/package.json > dist/npm/$(basename $(@F))/package.json 

$(publish):
	(cd dist/npm/$@; npm publish)

$(browser):: lib/patterns.browser.pre.js lib/patterns.browser.post.js
	@mkdir -p dist/browser/
	cat lib/patterns.browser.pre.js $@ lib/patterns.browser.post.js > dist/browser/$(@F)

clean:
	rm -rf dist
