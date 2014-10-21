# $Id: Encoding.pm 6444 2011-06-09 19:37:45Z chris $

=head1 NAME

WebService::IMDB::Encoding

=cut

package WebService::IMDB::Encoding;

use strict;
use warnings;

our $VERSION = '0.02';

use base qw(Class::Accessor);

use Carp;
our @CARP_NOT = qw(WebService::IMDB WebService::IMDB::Title);

__PACKAGE__->mk_accessors(qw(
    format
    url
));


=head1 METHODS

=head2 format

=head2 url

=cut

sub _new {
    my $class = shift;
    my $ws = shift;
    my $data = shift or die;

    my $self = {};

    bless $self, $class;

    $self->format($data->{'format'});
    $self->url($data->{'url'});

    return $self;
}

1;
