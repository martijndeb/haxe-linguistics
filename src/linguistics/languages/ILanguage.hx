package linguistics.languages;

import linguistics.tokenizers.ITokenizer;

interface ILanguage {

    var name:String;

    var basicTokenizer:Class<Dynamic>;
    var token:Class<Dynamic>;

}