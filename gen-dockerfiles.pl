#!/usr/bin/perl

use Template;
use Template::Constants qw( :debug );

use DDP alias => 'zzz', colored => 0, caller_info => 1;

my $tt = Template->new(
    {
        #    DEBUG => DEBUG_ALL
    }
);

my %builds = (

    'master-bookworm' => {
        'os_name'       => 'debian',
        'os_codename'   => 'bookworm',
        'koha_codename' => 'unstable',
        'koha_version'  => '22.06',
        'skip'          => 1,
    },

    'master-bullseye' => {
        'os_name'       => 'debian',
        'os_codename'   => 'bullseye',
        'koha_codename' => 'dev',
        'koha_version'  => '22.06',
        'default'       => 1,
    },


    'master-bullseye-cpan' => {
        'os_name'       => 'debian',
        'os_codename'   => 'bullseye',
        'koha_codename' => 'unstable',
        'koha_version'  => '22.06',
        'cpan'          => 1,
        'skip'          => 1,
    },

    'master-buster' => {
        'os_name'       => 'debian',
        'os_codename'   => 'buster',
        'koha_codename' => 'unstable',
        'koha_version'  => '22.06',
        'skip'          => 1,
    },

    'testing-bullseye' => {
        'os_name'       => 'debian',
        'os_codename'   => 'bullseye',
        'koha_codename' => 'testing',
        'koha_version'  => '22.06',
        'skip'          => 1,
    },

# ---------------


    '22.11-bullseye' => {
        'os_name'       => 'debian',
        'os_codename'   => 'bullseye',
        'koha_codename' => 'stable',
        'koha_version'  => '22.05',
        'skip'          => 1,
    },

    '22.05-bullseye' => {
        'os_name'       => 'debian',
        'os_codename'   => 'bullseye',
        'koha_codename' => 'oldstable',
        'koha_version'  => '22.05',
        'skip'          => 1,
    },

    '21.11-bullseye' => {
        'os_name'       => 'debian',
        'os_codename'   => 'bullseye',
        'koha_codename' => 'oldoldstable',
        'koha_version'  => '21.11',
        'skip'          => 1,
    },

    '21.05-bullseye' => {
        'os_name'       => 'debian',
        'os_codename'   => 'bullseye',
        'koha_codename' => '21.05',
        'koha_version'  => '21.05',
        'skip'          => 1,
    },


);

my $vars = { builds => \%builds };

my $template = 'gitlab-ci.yml';
$tt->process( "$template.tt", $vars, ".$template" ) || die $tt->error;

#exit;

$template = 'Dockerfile.tt';

foreach my $buildname ( keys %builds ) {

    my $b_href = $builds{$buildname};

    mkdir "dists/$buildname";
    my $docker_file = "dists/" . $buildname . '/Dockerfile';

    #    warn $docker_file;
    $tt->process( $template, $b_href, $docker_file )
      || die $tt->error;

}
