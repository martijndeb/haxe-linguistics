package linguistics.classifiers;

import linguistics.tokenizers.ITokenizer;

interface IClassifier {

    function addDocument( myDocument:String, myLabel:String ):Void;
    function train( ?myTokenizer:ITokenizer ):Void;
    function classify( myString:String ):haxe.ds.StringMap<Float>;

}