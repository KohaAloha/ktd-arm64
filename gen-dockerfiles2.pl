use Template;
use Template::Constants qw( :debug );

use DDP alias => 'zzz', colored => 0, caller_info => 1;

my $tt = Template->new(
    {
        #    DEBUG => DEBUG_ALL
    }
);

my %b3 = (
    'master-bullseye' => {
        'os_codename'   => 'bullseye',
        'koha_codename' => 'master',
        'koha_version'  => '22.06',
#        'skip'          => 1,
    },

    'testing-bullseye' => {
        'os_codename'   => 'bullseye',
        'koha_codename' => 'testing',
        'koha_version'  => '22.06',
        'skip'          => 1,
    },

    '22.05-bullseye' => {
        'os_codename'   => 'bullseye',
        'koha_codename' => 'stable',
        'koha_version'  => '22.05',
        'skip'          => 1,
    },

    '21.11-bullseye' => {
        'os_codename'   => 'bullseye',
        'koha_codename' => 'oldstable',
        'koha_version'  => '21.11',
        'default'       => 1,
    },

    '21.05-bullseye' => {
        'os_codename'   => 'bullseye',
        'koha_codename' => 'oldoldstable',
        'koha_version'  => '21.05',
        'skip'          => 1,
    },

);

my $vars = { b3 => \%b3 };

zzz %b3;

my @bs = ( keys %builds );
zzz @bs;

my $template = '.gitlab-ci.yml';

# $tt->process( "$template.tt", \%data, $template  ) || die $tt->error;
# $tt->process( "$template.tt", $vars ) || die $tt->error;
$tt->process( "$template.tt", $vars, $template ) || die $tt->error;

#exit;

$template = 'Dockerfile.tt';

foreach my $b ( keys %b3 ) {

    #    zzz $b;

    #zzz @b33;

    #foreach my $b (

    my $d = $b3{$b};

    #    zzz $d;

    #--
    mkdir "dists/$b";
    my $docker_file = "dists/" . $b . '/Dockerfile';
    warn $docker_file;
    $tt->process( $template, $d, $docker_file )
      || die $tt->error;

    #--

}
