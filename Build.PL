
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Include the Math::Int64 C client API in your distribution",
  "dist_author" => [
    "Graham Ollis <plicease\@cpan.org>"
  ],
  "dist_name" => "Dist-Zilla-Plugin-MathInt64",
  "dist_version" => "0.05",
  "license" => "perl",
  "module_name" => "Dist::Zilla::Plugin::MathInt64",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Dist::Zilla::File::InMemory" => 0,
    "Dist::Zilla::Role::FileGatherer" => 0,
    "Dist::Zilla::Role::FileMunger" => 0,
    "Dist::Zilla::Role::Plugin" => 0,
    "Dist::Zilla::Role::PrereqSource" => 0,
    "ExtUtils::Typemaps" => 0,
    "File::ShareDir" => 0,
    "Moose" => 0,
    "Path::Class::Dir" => 0,
    "Path::Class::File" => 0,
    "perl" => "5.006"
  },
  "script_files" => [],
  "share_dir" => {
    "dist" => "share"
  },
  "test_requires" => {
    "Path::Class" => 0,
    "Test::DZil" => 0,
    "Test::More" => "0.88"
  }
);


my %fallback_build_requires = (
  "Module::Build" => "0.3601",
  "Path::Class" => 0,
  "Test::DZil" => 0,
  "Test::More" => "0.88"
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  delete $module_build_args{test_requires};
  $module_build_args{build_requires} = \%fallback_build_requires;
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
