#
# This file is part of Games::Risk.
# Copyright (c) 2008 Jerome Quelin, all rights reserved.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU GPLv3+.
#
#

package Games::Risk;

use 5.010;
use strict;
use warnings;

use Games::Risk::GUI::Board;
use Games::Risk::Heap;
use Games::Risk::Map;
use Games::Risk::Player;
use List::Util   qw{ shuffle };
use Module::Util qw{ find_installed };
use POE;
use aliased 'POE::Kernel' => 'K';


# Public variables of the module.
our $VERSION = '0.1.0';


#--
# CLASS METHODS

# -- public methods

#
# my $id = Games::Risk->spawn( \%params )
#
# This method will create a POE session responsible for a classical risk
# game. It will return the poe id of the session newly created.
#
# You can tune the session by passing some arguments as a hash reference.
# Currently, no params can be tuned.
#
sub spawn {
    my ($type, $args) = @_;

    my $session = POE::Session->create(
        args          => [ $args ],
        heap          => Games::Risk::Heap->new,
        inline_states => {
            # private events - session management
            _start         => \&_onpriv_start,
            _stop          => sub { warn "GR shutdown\n" },
            # private events - game states
            _start_assign_countries     => \&_onpriv_start_assign_countries,
            _start_place_initial_armies => \&_onpriv_start_place_initial_armies,
            # public events
            board_ready      => \&_onpub_gui_ready,
        },
    );
    return $session->ID;
}


#--
# EVENTS HANDLERS

# -- public events

sub _onpub_gui_ready {
    my $h = $_[HEAP];

    K->post('board', 'load_map', $h->map);

    # create players - FIXME: number of players
    my @players;
    push @players, Games::Risk::Player->new;
    push @players, Games::Risk::Player->new;
    push @players, Games::Risk::Player->new;
    push @players, Games::Risk::Player->new;
    
    @players = shuffle @players; 

    #FIXME: broadcast
    foreach my $player ( @players ) {
        K->post('board', 'newplayer', $player);
    }

    $h->_players(\@players); # FIXME: private

    K->yield( '_start_assign_countries' );
}


# -- private events - game states

#
# event: _start_assign_countries()
#
# distribute randomly countries to players.
# FIXME: what in the case of a loaded game?
# FIXME: this can be configured so that players pick the countries
# of their choice, turn by turn
#
sub _onpriv_start_assign_countries {
    my $h = $_[HEAP];

    $h->distribute_countries;
    K->yield( '_start_place_initial_armies' );
}


#
# event: _start_place_initials_armies()
#
# require players to place initials armies.
#
sub _onpriv_start_place_initial_armies {
}


# -- private events - session management

#
# event: _start( \%params )
#
# Called when the poe session gets initialized. Receive a reference
# to %params, same as spawn() received.
#
sub _onpriv_start {
    my $h = $_[HEAP];

    K->alias_set('risk');

    # load model
    # FIXME: hardcoded
    my $path = find_installed(__PACKAGE__);
    $path =~ s/\.pm$//;
    $path .= '/maps/risk.map';
    my $map = Games::Risk::Map->new;
    $map->load_file($path);
    $h->map($map);


    Games::Risk::GUI::Board->spawn({toplevel=>$poe_main_window});
}




1;
__END__


=head1 NAME

Games::Risk - classical 'risk' board game



=head1 SYNOPSIS

    use Games::Risk;
    Games::Risk->spawn;
    POE::Kernel->run;
    exit;



=head1 DESCRIPTION

Risk is a strategic turn-based board game. Players control armies, with
which they attempt to capture territories from other players. The goal
of the game is to control all the territories (C<conquer the world>)
through the elimination of the other players. Using area movement, Risk
ignores realistic limitations, such as the vast size of the world, and
the logistics of long campaigns.

This module implements a graphical interface for this game.



=head1 PUBLIC METHODS

=head2 my $id = Games::Risk->spawn( \%params )

This method will create a POE session responsible for a classical risk
game. It will return the poe id of the session newly created.

You can tune the session by passing some arguments as a hash reference.
Currently, no params can be tuned.


=begin quiet_pod_coverage

=item * K

=end quiet_pod_coverage



=head1 BUGS

Please report any bugs or feature requests to C<bug-games-risk at
rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Games-Risk>.  I will be
notified, and then you'll automatically be notified of progress on your
bug as I make changes.



=head1 SEE ALSO

You can find more information on the classical C<risk> game on wikipedia
at L<http://en.wikipedia.org/wiki/Risk_game>.

You might also want to check jRisk, a java-based implementation of Risk,
which inspired me quite a lot.


You can also look for information on this module at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Games-Risk>


=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Games-Risk>


=item * Open bugs

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Games-Risk>


=back



=head1 AUTHOR

Jerome Quelin, C<< <jquelin@cpan.org> >>



=head1 COPYRIGHT & LICENSE

Copyright (c) 2008 Jerome Quelin, all rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


=cut

