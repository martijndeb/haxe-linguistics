package linguistics.tokenizers.tokens;

interface IToken {

    var documentIndex:Int;
    var relativeIndex:Int;

    var token:String;
    var normalizedToken:String;

    function isValidFor( myTokenString:String ):Bool;
    function normalize():String;
    function toString():String;

}