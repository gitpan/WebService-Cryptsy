use 5.006;
use strict;
use warnings FATAL => 'all';
use Module::Build;


my $builder = Module::Build->new(
    recursive_test_files => 1,
    module_name         => 'WebService::Cryptsy',
    license             => 'Artistic_2_0',
    dist_author         => q{Zoffix Znet <zoffix@cpan.org>},
    dist_version_from   => 'lib/WebService/Cryptsy.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build' => 0,
    },
    build_requires => {
        'Test::More' => 0,
        'Test::Deep' => 0,
    },
    requires => {
        'Carp'                  => 0,
        'Moo'                   => 1.003001,
        'URI'                   => 0,
        'JSON::MaybeXS'         => 0,
        'LWP::UserAgent'        => 0,
        'LWP::Protocol::https' => 6.02,
        'Digest::SHA'           => 0,
        'HTTP::Request::Common' => 0,
        'constant'              => 0,
        'overload'              => 0,
        'perl'                  => '5.006',
    },
    add_to_cleanup     => [ 'WebService-Cryptsy-*' ],
    create_makefile_pl => 'traditional',
);
if ( $ENV{RELEASE_TESTING} ) {
    system('pod2text lib/WebService/Cryptsy.pm > README');
}

$builder->create_build_script();
