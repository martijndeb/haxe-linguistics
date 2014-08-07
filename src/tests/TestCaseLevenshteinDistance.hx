package tests;

import linguistics.distances.LevenshteinDistance;

class TestCaseLevenshteinDistance extends haxe.unit.TestCase {

    public function testLevenshteinDistance():Void {

        this.assertEquals( 3, LevenshteinDistance.getDistance( "kitten", "sitting" ) );
        this.assertEquals( 3, LevenshteinDistance.getDistance( "Saturday", "Sunday" ) );

    }

 }