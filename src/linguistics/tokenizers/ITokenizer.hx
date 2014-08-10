package linguistics.tokenizers;

import linguistics.tokenizers.tokens.IToken;
import linguistics.tokenizers.filters.ITokenFilter;

interface ITokenizer {

    function tokenize ( myString:String ):Array<IToken>;
    function applyFilter( myTokenSet:Array<IToken>, myTokenFilter:Class<ITokenFilter> ):Array<IToken>;

}