# $Id: Review.pm 6449 2011-06-10 01:01:53Z chris $

=head1 NAME

WebService::IMDB::Review

=cut

package WebService::IMDB::Review;

use strict;
use warnings;

our $VERSION = '0.03';

use base qw(Class::Accessor);

use Carp;
our @CARP_NOT = qw(WebService::IMDB WebService::IMDB::Title);

__PACKAGE__->mk_accessors(qw(
    attr
    label
    url
));


=head1 METHODS

=head2 attr

=head2 label

=head2 url

=cut

sub _new {
    my $class = shift;
    my $ws = shift;
    my $data = shift or die;

    my $self = {};

    bless $self, $class;

    if (exists $data->{'attr'}) { $self->attr($data->{'attr'}); }
    if (exists $data->{'label'}) { $self->label($data->{'label'}); }
    $self->url($data->{'url'});

    return $self;
}

1;
