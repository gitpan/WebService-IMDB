# $Id: UserComment.pm 6449 2011-06-10 01:01:53Z chris $

=head1 NAME

WebService::IMDB::UserComment

=cut

package WebService::IMDB::UserComment;

use strict;
use warnings;

our $VERSION = '0.03';

use base qw(Class::Accessor);

use Carp;
our @CARP_NOT = qw(WebService::IMDB WebService::IMDB::Title);

__PACKAGE__->mk_accessors(qw(
    date
    status
    summary
    text
    user_location
    user_name
    user_rating
    user_score
    user_score_count
));


=head1 METHODS

=head2 date

=head2 status

=head2 summart

=head2 text

=head2 user_location

=head2 user_name

=head2 user_rating

=head2 user_score

=head2 user_score_count

=cut

sub _new {
    my $class = shift;
    my $ws = shift;
    my $data = shift or die;

    my $self = {};

    bless $self, $class;

    $self->date(WebService::IMDB::Date->_new($ws, $data->{'date'}));
    $self->status($data->{'status'});
    if (exists $data->{'summary'}) { $self->summary($data->{'summary'}); }
    $self->text($data->{'text'});
    if (exists $data->{'user_location'}) { $self->user_location($data->{'user_location'}); }
    if (exists $data->{'user_name'}) { $self->user_name($data->{'user_name'}); }
    if (exists $data->{'user_rating'}) { $self->user_rating($data->{'user_rating'}); }
    if (exists $data->{'user_score'}) { $self->user_score($data->{'user_score'}); }
    if (exists $data->{'user_score_count'}) { $self->user_score_count($data->{'user_score_count'}); }

    return $self;
}

1;
