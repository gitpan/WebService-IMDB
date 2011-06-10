# $Id: Runtime.pm 6444 2011-06-09 19:37:45Z chris $

=head1 NAME

WebService::IMDB::Runtime

=cut

package WebService::IMDB::Runtime;

use strict;
use warnings;

our $VERSION = '0.02';

use Carp;
our @CARP_NOT = qw(WebService::IMDB WebService::IMDB::Title);

use DateTime::Duration;


sub _new {
    my $class = shift;
    my $ws = shift;
    my $data = shift or die;

    if (exists $data->{'time'}) {
	return DateTime::Duration->new('seconds' => $data->{'time'});

    } else {
	croak "Unable to parse runtime";
    }
}

1;
