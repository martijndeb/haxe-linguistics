package linguistics.languages;

import linguistics.languages.LanguageBase;
import linguistics.tokenizers.ITokenizer;

class English extends LanguageBase {

    public function new() { super(); }

    override private function setProperties():Void {

        name = "English";
        basicStemmer = linguistics.languages.en.PorterStemmerEN;

    }

    override public function createTokens():Void {

        var tokenizer:ITokenizer = Type.createInstance( basicTokenizer, [] );

        stopwords = tokenizer.tokenize(

            "a about after all also am an and another any are as at be" +
            "because been before being between both but by came can" +
            "come could did do each for from get got has had" +
            "he have her here him himself his how if in into" +
            "is it like make many me might more most much must" +
            "my never now of on only or other our out over" +
            "said same see should since some still such take than" +
            "that the their them then there these they this those" +
            "through to too under up very was way we well were" +
            "what where which while who with would you your"

        );

    }

}