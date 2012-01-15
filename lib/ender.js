!function (doc, $) {
    var pattern = require('hyphenation.{language}');
    
    $.hyphenate.registerLanguage(pattern);

}(document, ender);