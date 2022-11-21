use Template;
my $tt = Template->new;


my %data = ( os_codename   => 'buster',
             koha_codename => '21.11');

my $template = 'Dockerfile.tt';


warn  $data{os_codename};

$tt->process('split.tt', { teams => \@teams }, 'split.csv');


my $docker_file = "dists/". $data{os_codename} . '/Dockerfile';
warn $docker_file;


$tt->process( $template , \%data, $docker_file )
    || die $tt->error;

