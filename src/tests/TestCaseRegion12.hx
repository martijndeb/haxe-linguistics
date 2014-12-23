package tests;

import linguistics.stemmers.Region12;

class TestCaseRegion12 extends haxe.unit.TestCase {

    public function testRegion12():Void {


        var regions:Region12 = new Region12( [ 'a', 'e', 'i', 'o', 'u', 'y' ] );
        var R1:String = "";
        var R2:String = "";

        // List from: http://snowball.tartarus.org/texts/r1r2.html
        R1 = regions.getRegion1( "beautiful" );
        R2 = regions.getRegion2( "beautiful", R1 );
        this.assertEquals( "iful", R1 );
        this.assertEquals( "ul", R2 );

        R1 = regions.getRegion1( "beauty" );
        R2 = regions.getRegion2( "beauty", R1 );
        this.assertEquals( "y", R1 );
        this.assertEquals( "", R2 );

        R1 = regions.getRegion1( "beau" );
        R2 = regions.getRegion2( "beau", R1 );
        this.assertEquals( "", R1 );
        this.assertEquals( "", R2 );

        R1 = regions.getRegion1( "animadversion" );
        R2 = regions.getRegion2( "animadversion", R1 );
        this.assertEquals( "imadversion", R1 );
        this.assertEquals( "adversion", R2 );

        R1 = regions.getRegion1( "sprinkled" );
        R2 = regions.getRegion2( "sprinkled", R1 );
        this.assertEquals( "kled", R1 );
        this.assertEquals( "", R2 );

        R1 = regions.getRegion1( "eucharist" );
        R2 = regions.getRegion2( "eucharist", R1 );
        this.assertEquals( "harist", R1 );
        this.assertEquals( "ist", R2 );

    }


 }