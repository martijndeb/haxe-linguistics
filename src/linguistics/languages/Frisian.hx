package linguistics.languages;

import linguistics.languages.ILanguage;
import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;

class Frisian implements ILanguage {

    static public var basicTokenExpression:EReg = ~/[^a-zA-Z0-9_\-âêîôûáéíóúÂÊÎÔÛÁÉÍÓÚ]+/g;

    public var name:String = "Frisian";

    public var basicTokenizer:Class<Dynamic> = linguistics.languages.fry.BasicTokenizerFRY;
    public var lengthBasedTokenizer:Class<Dynamic> = linguistics.languages.fry.LengthBasedTokenizerFRY;
    public var boundaryTokenizer:Class<Dynamic> = linguistics.tokenizers.BoundaryTokenizer;

    public var token:Class<Dynamic> = linguistics.tokenizers.tokens.Token;
    public var boundaryToken:Class<Dynamic> = linguistics.tokenizers.tokens.BoundaryToken;

    public var basicStemmer:Class<Dynamic> = null;

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

        // TODO: Stopwords could be improved and should be checked.
        // Extracted from older texts using http://argyf.fryske-akademy.eu/files/tdb/
        stopwords = tokenizer.tokenize(

            "'e 'k 't al as bij by dan dat de den der dij do doe doe't dwaen dy dêr dêr't ek " +
            "en er fan foar folle gau gean gjin goed guod ha har hat haw het hie hiene him hinne " +
            "hja hjir hoe hoe't hy ik in is it jild jimme jit jo jou kaam ken kenne kin kinne " +
            "koe komme komt lang man mar mat mear mei moast moat my myn mynhear neat nei net no " +
            "oan oare oars oer of oft om op ris sa se sei sels sil sjen soe syn ta te toe troch " +
            "tsjin waard want wat weard wer wier wirde woe wol wy wêr wêr't yn âlde ôf út ût"

        );

    }

}