#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;
use Test::Deep;

plan tests => 1;

use WebService::Cryptsy;

my $cryp = WebService::Cryptsy->new( timeout => 10 );

my $data = $cryp->marketdata;

if ( $data ) {
    cmp_deeply(
        $data,
        {
            markets => hash_each(
                {
                    'primaryname' => re('.'),
                    'volume' => re('^[-+.\d]+$'),
                    'lasttradeprice' => re('^[-+.\d]+$'),
                    'marketid' => re('^\d+$'),
                    'secondarycode' => re('.'),
                    'primarycode' => re('.'),
                    'lasttradetime' => re('.'),
                    'label' => re('.'),
                    'secondaryname' => re('.'),
                    'buyorders' => any(
                        array_each(
                            {
                                'quantity' => re('^[-+.\d]+$'),
                                'price' => re('^[-+.\d]+$'),
                                'total' => re('^[-+.\d]+$'),
                            },
                        ),
                        undef,
                    ),
                    'sellorders' => array_each(
                        {
                            'quantity' => re('^[-+.\d]+$'),
                            'price' => re('^[-+.\d]+$'),
                            'total' => re('^[-+.\d]+$'),
                        },
                    ),
                    'recenttrades' => array_each(
                        {
                            'quantity' => re('^[-+.\d]+$'),
                            'price' => re('^[-+.\d]+$'),
                            'total' => re('^[-+.\d]+$'),
                            'id' => re('.'),
                            'time' => re('.'),
                        },
                    ),
                }
            ),
        },
        '->marketdata returned an expected hashref'
    );
}
else {
    diag "Got an error getting an API request: $cryp";
    ok( length $cryp->error );
}