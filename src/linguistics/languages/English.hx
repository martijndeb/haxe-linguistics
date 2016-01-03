package linguistics.languages;

import linguistics.languages.ILanguage;
import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;

class English implements ILanguage {

    static public var basicTokenExpression:EReg = ~/[^a-zA-Z0-9_\-]+/g;

    public var name:String = "English";

    public var basicTokenizer:Class<Dynamic> = linguistics.tokenizers.BasicTokenizer;
    public var lengthBasedTokenizer:Class<Dynamic> = linguistics.tokenizers.LengthBasedTokenizer;

    public var token:Class<Dynamic> = linguistics.tokenizers.tokens.Token;

    public var basicStemmer:Class<Dynamic> = linguistics.languages.en.PorterStemmerEN;

    public var stopwords:Array<IToken>;

    public var sentenceBoundaries:Array<String>;

    public function new() { }

    public function createBoundaries():Void {

        sentenceBoundaries = new Array<String>( );
        sentenceBoundaries.push( "!" );
        sentenceBoundaries.push( "." );

    }

    public function createTokens():Void {

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