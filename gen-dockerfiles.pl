use Template;

use DDP alias => 'zzz', colored => 0, caller_info => 1;

my $tt = Template->new;


my %builds = (
    'unstable-bullseye' => {
        'os_codename'   => 'bullseye',
        'koha_codename' => 'unstable',
        'koha_version' => '22.06',
    },

    'testing-bullseye' => {
        'os_codename'   => 'bullseye',
        'koha_codename' => 'testing',
        'koha_version' => '22.06',
    },

    '22.05-bullseye' => {
        'os_codename'   => 'bullseye',
        'koha_codename' => 'stable',
        'koha_version' => '22.05',
    },

    '21.11-bullseye' => {
        'os_codename'   => 'bullseye',
        'koha_codename' => 'oldstable',
        'koha_version' => '21.11',
    },

    '21.05-bullseye' => {
        'os_codename'   => 'bullseye',
        'koha_codename' => 'oldoldstable',
        'koha_version' => '21.05',
    },

);

zzz %b3;

foreach my $b ( keys %builds ) {

    zzz $b3{$b};

    #zzz @b33;

    #foreach my $b (

    my %data = (
        os_codename   => 'buster',
        koha_codename => '21.11'
    );

    my $template = 'Dockerfile.tt';

    warn $data{os_codename};

    mkdir "dists/$b";

    my $docker_file = "dists/" . $b  . '/Dockerfile';
    warn $docker_file;

    $tt->process( $template, \%data, $docker_file )
      || die $tt->error;

}
