# $Id: Runtime.pm 6449 2011-06-10 01:01:53Z chris $

=head1 NAME

WebService::IMDB::Runtime

=cut

package WebService::IMDB::Runtime;

use strict;
use warnings;

our $VERSION = '0.03';

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
