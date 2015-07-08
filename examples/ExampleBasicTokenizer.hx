package examples;

import linguistics.Linguistics;
import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;
import linguistics.tokenizers.filters.StopwordTokenFilter;
import linguistics.languages.Dutch;

class ExampleBasicTokenizer
{
    static public function main():Void {

        Linguistics.getInstance().setLanguage(Dutch);
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();
        var tokenSet:Array<IToken> = tokenizer.tokenize( "Ik wil 's morgens gemiddeld 2 koppen koffie drinken." );

        trace( tokenSet );
        trace( tokenizer.applyFilter( tokenSet, StopwordTokenFilter ) );

    }
}