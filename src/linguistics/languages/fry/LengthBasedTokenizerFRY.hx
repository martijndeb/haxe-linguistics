package linguistics.languages.fry;

import linguistics.tokenizers.LengthBasedTokenizer;

class LengthBasedTokenizerFRY extends LengthBasedTokenizer {

    public function new( ?length:Int ) {

        super( length );

        tokenExpression = Frisian.basicTokenExpression;

    }

}