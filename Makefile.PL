
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;

use File::ShareDir::Install;
install_share dist => "share";


my %WriteMakefileArgs = (
  "ABSTRACT" => "Include the Math::Int64 C client API in your distribution",
  "AUTHOR" => "Graham Ollis <plicease\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "File::ShareDir::Install" => "0.03"
  },
  "DISTNAME" => "Dist-Zilla-Plugin-MathInt64",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dist::Zilla::Plugin::MathInt64",
  "PREREQ_PM" => {
    "Dist::Zilla::File::InMemory" => 0,
    "Dist::Zilla::Role::FileGatherer" => 0,
    "Dist::Zilla::Role::FileMunger" => 0,
    "Dist::Zilla::Role::Plugin" => 0,
    "Dist::Zilla::Role::PrereqSource" => 0,
    "File::ShareDir" => 0,
    "Moose" => 0,
    "Path::Class::Dir" => 0,
    "Path::Class::File" => 0
  },
  "TEST_REQUIRES" => {
    "Path::Class" => 0,
    "Test::DZil" => 0,
    "Test::More" => "0.88"
  },
  "VERSION" => "0.04",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Dist::Zilla::File::InMemory" => 0,
  "Dist::Zilla::Role::FileGatherer" => 0,
  "Dist::Zilla::Role::FileMunger" => 0,
  "Dist::Zilla::Role::Plugin" => 0,
  "Dist::Zilla::Role::PrereqSource" => 0,
  "File::ShareDir" => 0,
  "Moose" => 0,
  "Path::Class" => 0,
  "Path::Class::Dir" => 0,
  "Path::Class::File" => 0,
  "Test::DZil" => 0,
  "Test::More" => "0.88"
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);

{
package
MY;
use File::ShareDir::Install qw(postamble);
}


