#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Deep;

plan tests => 1;

use WebService::Cryptsy;

my $cryp = WebService::Cryptsy->new( timeout => 10 );

my $data = $cryp->singlemarketdata( 60 );
if ( $data ) {
    cmp_deeply(
        $data,
        {
            'markets' => hash_each(
                {
                    'primaryname' => 'InfiniteCoin',
                    'secondaryname' => 'LiteCoin',
                    'label' => 'IFC/LTC',
                    'volume' => re('^[-+.\d]+$'),
                    'lasttradeprice' => re('^[-+.\d]+$'),
                    'marketid' => re('^\d+$'),
                    'primarycode' => 'IFC',
                    'secondarycode' => 'LTC',
                    'lasttradetime' => re('.'),
                    'sellorders' => array_each(
                        {
                            'quantity' => re('^[-+.\d]+$'),
                            'price' => re('^[-+.\d]+$'),
                            'total' => re('^[-+.\d]+$')
                        },
                    ),
                    'buyorders' => array_each(
                        {
                            'quantity' => re('^[-+.\d]+$'),
                            'price' => re('^[-+.\d]+$'),
                            'total' => re('^[-+.\d]+$'),
                        },
                    ),
                    'recenttrades' => array_each(
                        {
                            'time' => re('.'),
                            'quantity' => re('^[-+.\d]+$'),
                            'price' => re('^[-+.\d]+$'),
                            'id' => re('^[-+.\d]+$'),
                            'total' => re('^[-+.\d]+$'),
                        },
                    ),
                },
            ),
        },
        '->singlemarketdata returns an expected hashref',
    );
}
else {
    diag "Possibly got an error getting an API request: $cryp";
    ok( length $cryp->error );
}