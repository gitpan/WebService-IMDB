# $Id: NewsSource.pm 6444 2011-06-09 19:37:45Z chris $

=head1 NAME

WebService::IMDB::NewsSource

=cut

package WebService::IMDB::NewsSource;

use strict;
use warnings;

our $VERSION = '0.02';

use base qw(Class::Accessor);

use Carp;
our @CARP_NOT = qw(WebService::IMDB WebService::IMDB::Name WebService::IMDB::News);

__PACKAGE__->mk_accessors(qw(
    label
    logo
    url
));


=head1 METHODS

=head2 label

=head2 logo

=head2 url

=cut

sub _new {
    my $class = shift;
    my $ws = shift;
    my $data = shift or die;

    my $self = {};

    bless $self, $class;

    $self->label($data->{'label'});
    if (exists $data->{'logo'}) { $self->logo($data->{'logo'}); }
    if (exists $data->{'url'}) { $self->url($data->{'url'}); }

    return $self;
}

1;
