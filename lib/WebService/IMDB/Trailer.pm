# $Id: Trailer.pm 6449 2011-06-10 01:01:53Z chris $

=head1 NAME

WebService::IMDB::Trailer

=cut

package WebService::IMDB::Trailer;

use strict;
use warnings;

our $VERSION = '0.03';

use base qw(Class::Accessor);

use Carp;
our @CARP_NOT = qw(WebService::IMDB WebService::IMDB::Title);

use WebService::IMDB::Encoding;
use WebService::IMDB::Image;

__PACKAGE__->mk_accessors(qw(
    content_type
    description
    duration
    encodings
    slates
    title
    type
));


=head1 METHODS

=head2 content_type

=head2 description

=head2 duration

=head2 encodings

=head2 slates

=head2 title

=head2 type

=cut

sub _new {
    my $class = shift;
    my $ws = shift;
    my $data = shift or die;

    my $self = {};

    bless $self, $class;

    $self->content_type($data->{'content_type'});
    $self->description($data->{'description'});
    $self->duration( DateTime::Duration->new('seconds' => $data->{'duration_seconds'}) );
    $self->encodings( { map { $_ => WebService::IMDB::Encoding->_new($ws, $data->{'encodings'}->{$_} ) }  keys %{$data->{'encodings'}}} );
    $self->slates( [ map { WebService::IMDB::Image->_new($ws, $_) } @{$data->{'slates'}} ] );
    $self->title($data->{'title'});
    $self->type($data->{'@type'});

    return $self;
}

1;
