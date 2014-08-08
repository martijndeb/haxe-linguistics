package linguistics.classifiers;

import linguistics.tokenizers.ITokenizer;
import linguistics.classifiers.Classification;

interface IClassifier {

    function addDocument( myDocument:String, myLabel:String ):Void;
    function train( ?myTokenizer:ITokenizer ):Void;
    function classify( myString:String ):Array<Classification>;

}