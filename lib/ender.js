!function (doc, $) {
    var pattern = require('hyphenation.{language}');

    $.registerHyphenationLanguage(pattern);

}(document, ender);