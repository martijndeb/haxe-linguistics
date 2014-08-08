package linguistics.classifiers;

class Classification {

    public var label:String;
    public var probability:Float;
    public var pc:Float;

    public function new( myLabel:String, myProbability:Float, myPc:Float ) {

        label = myLabel;
        probability = myProbability;
        pc = myPc;

    }

    public function toString():String {

        return label + ": " + probability;

    }

}