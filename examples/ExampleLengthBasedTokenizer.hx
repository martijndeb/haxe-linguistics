package examples;

import linguistics.Linguistics;
import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;
import linguistics.languages.Dutch;

class ExampleLengthBasedTokenizer
{
    static public function main():Void {

        Linguistics.getInstance().setLanguage(Dutch);
        var tokenizer:ITokenizer = Linguistics.getInstance().getLengthBasedTokenizer(5);
        var tokenSet:Array<IToken> = tokenizer.tokenize( "Ik wil 's morgens gemiddeld 2 koppen koffie drinken." );

        trace( tokenSet );

    }
}