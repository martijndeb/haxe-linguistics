package linguistics.languages;

import linguistics.languages.ILanguage;
import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;

class Dutch implements ILanguage {

    static public var basicTokenExpression:EReg = ~/[^a-zA-Z0-9_\-'âêîôûàèìòùëïöüŸáéíóúýÂÊÎÔÛÀÈÌÒÙËÏÖÜŸÁÉÍÓÚÝ]+/g;

    public var name:String = "Dutch";

    public var basicTokenizer:Class<Dynamic> = linguistics.languages.nl.BasicTokenizerNL;
    public var lengthBasedTokenizer:Class<Dynamic> = linguistics.languages.nl.LengthBasedTokenizerNL;

    public var token:Class<Dynamic> = linguistics.tokenizers.tokens.Token;

    public var basicStemmer:Class<Dynamic> = linguistics.languages.nl.PorterStemmerNL;

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

            "aan af al alles als altijd andere ben bij daar dan dat de der deze die dit " +
            "doch doen door dus een eens en er ge geen geweest haar had heb hebben heeft " +
            "hem het hier hij  hoe hun iemand iets ik in is ja je  kan kon kunnen maar me " +
            "meer men met mij mijn moet na naar niet niets nog nu of om omdat ons ook op " +
            "over reeds te tegen toch toen tot u uit uw van veel voor want waren was wat " +
            "we wel werd wezen wie wij wil worden zal ze zei zelf zich zij zijn zo zonder zou"

         );

    }
}