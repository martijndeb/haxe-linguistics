package linguistics.languages.nl;

import linguistics.tokenizers.LengthBasedTokenizer;

class LengthBasedTokenizerNL extends LengthBasedTokenizer {

    public function new( ?length:Int ) {

        super( length );

        tokenExpression = Dutch.basicTokenExpression;

    }

}