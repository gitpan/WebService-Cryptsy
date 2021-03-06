
# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v5.020.
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker ;



my %WriteMakefileArgs = (
  "ABSTRACT" => "implementation of www.cryptsy.com API",
  "AUTHOR" => "Zoffix Znet <cpan\@zoffix.com>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "WebService-Cryptsy",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "WebService::Cryptsy",
  "PREREQ_PM" => {
    "Digest::SHA" => 0,
    "HTTP::Request::Common" => 0,
    "JSON::MaybeXS" => 0,
    "LWP::Protocol::https" => 0,
    "LWP::UserAgent" => 0,
    "Moo" => "1.004002",
    "URI" => 0,
    "constant" => 0,
    "overload" => 0
  },
  "TEST_REQUIRES" => {
    "Data::Dumper" => 0,
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::Deep" => 0,
    "Test::More" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.008005",
  "test" => {
    "TESTS" => "t/*.t t/API/authenticated/*.t t/API/public/*.t"
  }
);


my %FallbackPrereqs = (
  "Data::Dumper" => 0,
  "Digest::SHA" => 0,
  "File::Spec" => 0,
  "HTTP::Request::Common" => 0,
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "JSON::MaybeXS" => 0,
  "LWP::Protocol::https" => 0,
  "LWP::UserAgent" => 0,
  "Moo" => "1.004002",
  "Test::Deep" => 0,
  "Test::More" => 0,
  "URI" => 0,
  "constant" => 0,
  "overload" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



