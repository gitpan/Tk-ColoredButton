#!/usr/bin/perl
#================================================================
# Date : 17/06/2010 00:04:04
# Author : Djibril Ousmanou
# Main   : Test the module by creation of severals buttons
#================================================================
use strict;
use warnings;

use Tk;
use Tk::ColoredButton;
use Tk::PNG;

my $mw = MainWindow->new( -background => 'white', -title => 'create button');
$mw->minsize( 300, 300 );

my $pixmap1 = <<PIXMAP;
/* XPM */
static char * Icon_xpm[] = {
"32 32 4 1",
"     c none",
".    c #000000000000",
"X    c #9E6DF3",
"o    c #0000FFFF0000",
"                                ",
"       ..                ..     ",
"      ...               ...     ",
"      .X..             .....    ",
"     ..XX..            ......   ",
"     .X..X.           ...X...   ",
"    ..X.X.X. .......  .......   ",
"    .X.XXX....XXXXX...........  ",
"   ..X.X..XXXXXXXXXXXX........  ",
"   .XX...XXXXXXXXXXXXXXX......  ",
"   .X..XXXXXXXXXXXXXXXXXX.....  ",
"   ...XXXXXXXXXXXXXXXXXXXX....  ",
"   .XXXXXXXXXXXXXXXXXXXXXXX...  ",
"   .XXXXXXXXXXXXXXXXXXXXXXXXX.  ",
"  ..XXX.....XXXXXXX.....XXXXX.  ",
"  .XXX.ooooo.XXXXX.ooooo.XXXX.  ",
"  .XX.ooooo.o.XXX.o.ooooo.XXX.  ",
" ..XX.ooooooo.XXX.ooooooo.XXX.  ",
" .XXXX.ooooo.XXXXX.ooooo.XXXXX. ",
" .XXXXX.....XXXXXXX.....XXXXXX. ",
" .XXXXXXXXXXXXXXXXXXXXXXXXXXXX. ",
" .XXXXXXXXXXXXX.XXXXXXXXXXXXXX. ",
" .XXXXXXXXXXXXXXXXXXXXXXXXXXXX. ",
"..XXX..XXXXXXXXXXXXXXXXXXXXXXXX.",
".XXX.XX.XXXXXXXXXXXXXXXX...XXX..",
".XX.XX.XXXXXXXXXXXXXXXX..XX.XX..",
".XX.X.X.XXXXX.XXX.XXXXX.X.XXX...",
".XXXX.X.XXXXXX...XXXXXXX.X.XX.X.",
"..XXX.X.XXXXXXXXXXXXXXXX.X.XX.X.",
".X.XXXXXXXXXXXXXXXXXXXXX.XXX.XX.",
".XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.",
".XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX."};
PIXMAP

my $pixmap2 = <<PIXMAP;
/* XPM */
static char * exemple_xpm[] = {
"24 20 3 1",
" 	c None",
".	c #3A32E4",
"+	c #E43232",
"                        ",
"    ..                  ",
"   ....                 ",
"  ......++++++++        ",
" .........+++++++       ",
" ..........+++++++      ",
" ............++++++     ",
" .............++++++    ",
"  ..............++++    ",
"   +.............+++    ",
"   ++.............++    ",
"   +++.............+    ",
"   +++++.............   ",
"   ++++++.............. ",
"   ++++++++............ ",
"   +++++++++........... ",
"    +++++++++.........  ",
"     ++++++++++.......  ",
"      ++++++++++.....   ",
"       +++++++++ ...    "};
PIXMAP

my $image = <<"DATA";
iVBORw0KGgoAAAANSUhEUgAAACQAAAAOCAMAAABw6U76AAAAB3RJTUUH1AsUERQYzfaDBAAAAAlw
SFlzAAALEgAACxIB0t1+/AAAAJlQTFRFn0EDPxoBIQ4B/5pX/2YAfTMC5V4EwlAE1VgE4V0E8GMF
/6tz////8dTA+bKC9+ng8GwU/7SC4KeC/49E8K6C/9Gy355y0HIz5YRD9GQF6KuC/3IV//bw9+DQ
57OR5nsz7cmx1GEU8MGhzWcj+pZT572h88Kh/3wk+vTv3W4k+NfB/+3hzlUE/+PR/4U0/8ik/9rB
/+bV5Hcu9l/TCwAAAK5JREFUeNqV0NsOgjAQBFDU6gIOYq2C2KJ4QfGK+v8f55YnJRh0kk26ycmk
WedRtubp9ERr+n+gIYwWClctgZsQJcDbvd50QqbPiC+M8kQDIIXAraFDgRQRJRIFjtI0I7EDAhoI
iRyZ2X9BCgjXgtFkA2ybkTYmxbJCK2TUjGaIYmBukZeQW6FwIaX6OAF/aIRwbBHvFbKZ+m9NA+Ju
j4jHIsEvn2y83y/udFrTfQGnKxbutFN/VQAAAABJRU5ErkJggg==
DATA

my $image_stop = <<DATA;
R0lGODlhEAAQAPe9ANsAAOfa2tIAAP8AAP/o6PoAAMd+OPUAANUAAPcAANgAANkAAPsAAP7//9cA
AP0AAJ1eKZ5dKdUUFOcAAJ5GLZ5HL+OSkv9mZv+Skv8FBaRqL6ZrL6wAAP+Rkf/i4ufY2N/Kyt7J
yf9KSu0AANxzc/9SUoI4GaA0Ia1vMalsMH0rE9a7u6ZQRPRCQp9JKP5fX6taKMBTU8qDOsyEOv/I
yP8gIN0AAMuGO//x8Z5DKqFKJdJdXebf39IfH8lqaqVRJbcAAPlyctM9PaBmLf+xsbEPC6pYJ/8p
KfodHfcbG//Nzf9ZWcJgYNKVlekQENa3t/4yMv/Bwc6IPM6Njf+oqP+vr4s4Gf9XV+jd3c4KCp1h
K9ENDf9HR93CwukAAOhYWMVPT38rE/4AAOYAAOsAAMidnefZ2aVSJv9JSfAAALFtMKdWJ//JyZ5B
J4ZIIKdVJotKIaRTQ6RURM0AAODJyf5QUMg3N9J/f65fKv/z885ZWf97e5xHIubc3NlZWfs7O+EA
AJ4VCf/GxtUZGcVmZqpMRf8WFrVoLumvr/9lZciTk5JYJ/qYmMUAAM4AAPKDg/ZtbckAAJQFAtcT
E+8AAPwAAP/d3XsiD4ckEP8HB/t6ev82Nv/h4fGoqNCJPdIqKqteWPuxscJtbenh4cWKisZDQ9W6
upxDHYU+G8oAAN4AAKQAAP+zs4AdDf/U1IE3GP2IiMpKSpYEAvIAAOQAAOm+vv/Ly84wMNm/v80u
LsBXV68FAv///9GKPQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAAL0ALAAAAAAQABAA
AAj/AHsJ7GXgTAU5cSj8MDCw4RpQtQjkwcEJUaE3DXvxaULAgyslbATZirLj1EAjUyzR6BSqChVG
jzB0sAOj1wwWrIhYKHMHliYfir6IQBJIBh4SeyCR4oVFD5g+vAglOBApgosgFxL5CcHrgxlepiRU
GgHASo4XV5aUEAKCFy9cWQYcmGAjTJs6XND8KRXAbYBPDCgBcqBCR4tNUGLx4PWkC69RucYASIXq
0K0jSUQ1WLFlEp0GTBY44KCl14kahpzEGDRATA9dAhQ4anWjl5oimTIUeJAgjRcACgTIGjIQwq4C
DGaRoaVqwRxJizKiwAQEAQAEjVZd2pBRoKcUcEy8BnKjQUrDgAA7
DATA

my $ObjImage  = $mw->Photo( -data => $image );
my $ObjImage2 = $mw->Photo( -data => $image_stop );
my $ObjPixmap1 = $mw->Pixmap(-data => $pixmap1);
my $ObjPixmap2 = $mw->Pixmap(-data => $pixmap2);

my %ColoredButtonConf = (
  -height  => 40,
  -width   => 160,
  -font    => '{arial} 12 bold',
  -command => sub { exit; },
);
my %ButtonConf = (
  -font             => '{arial} 12 bold',
  -command          => sub { print "test\n"; },
  -background       => '#F0D0FF',
  -activebackground => '#6BA8F2',
);

my %gradient1 = (
  -start_color  => '#FFFFFF',
  -end_color    => '#bfd4e8',
  -type         => 'mirror_vertical',
  -start        => 50,
  -end          => 100,
  -number_color => 30,
);
my %active_gradient1 = (
  -start_color  => '#bfd4e8',
  -end_color    => '#FFFFFF',
  -type         => 'mirror_vertical',
  -start        => 50,
  -end          => 100,
  -number_color => 30,
);

my %gradient2 = (
  -start_color  => 'red',
  -end_color    => 'white',
  -type         => 'linear_vertical',
  -number_color => 30,
);
my %gradient3 = (
  -start_color  => '#9933CC',
  -end_color    => 'white',
  -type         => 'corner_right',
  -number_color => 30,
);
my %active_gradient3 = (
  -start_color  => '#FFFFFF',
  -end_color    => '#bfd4e8',
  -type         => 'mirror_vertical',
  -start        => 50,
  -end          => 100,
  -number_color => 30,
);

# 6 boutons
my $Button1 = $mw->ColoredButton( -text => "Button1", %ColoredButtonConf, -tooltip => "Button1" );
my $Button2 = $mw->ColoredButton(
  -text => "Button2",
  %ColoredButtonConf,
  -tooltip        => "Button2",
  -gradient       => \%gradient1,
  -activegradient => \%active_gradient1,
  -image => $ObjPixmap2,
  -compound => 'top',
);
my $Button3 = $mw->ColoredButton(
  -text => "Button3",
  %ColoredButtonConf,
  -tooltip  => "Button3",
  -gradient => \%gradient2
);
my $Button4 = $mw->ColoredButton(
  -text => "Button4",
  %ColoredButtonConf,
  -tooltip        => "Button4",
  -gradient       => \%gradient3,
  -activegradient => \%active_gradient3,
  -image          => $ObjPixmap1,
);
my $Button5 = $mw->ColoredButton(
  -text => "Button5",
  %ColoredButtonConf,
  -tooltip  => "Button5",
  -gradient => { -start_color => '#FFCC33', -end_color => '#9999FF', },
);
my $Button6 = $mw->ColoredButton(
  -text => "Button6",
  %ColoredButtonConf,
  -tooltip        => "Button6",
  -gradient       => { -start_color => 'brown', -end_color => 'yellow', -type => 'radial' },
  -activegradient => { -start_color => 'yellow', -end_color => 'brown', -type => 'losange' },
);
my $Button7 = $mw->ColoredButton(
  -text => "Button7",
  %ColoredButtonConf,
  -tooltip        => "Button7",
  -gradient       => { -start_color => '#99CCCC', -end_color => '#999933', -type => 'corner_left' },
  -activegradient => { -start_color => 'white', -end_color => 'black', -type => 'corner_right' },
);
my $Button8 = $mw->ColoredButton(
  -text => "Button8",
  %ColoredButtonConf,
  -tooltip        => "Button8",
  -gradient       => { -start_color => '#666666', -end_color => '#00B0D0' },
  -activegradient => { -start_color => '#60C000', -end_color => '#7000D0' },
);
my $Button9 = $mw->ColoredButton(
  -text => "Button9",
  %ColoredButtonConf,
  -tooltip        => "Button9",
  -gradient       => { -start_color => '#F07FC0', -end_color => '#007FF0' },
  -activegradient => { -start_color => 'white', -end_color => '#FF7030' },
  -image          => $ObjImage,
  -compound       => 'right',
  -background     => 'red',
);
my $Button10 = $mw->ColoredButton(
  -text => "Button10",
  %ColoredButtonConf,
  -tooltip        => "Button10",
  -gradient       => { -start_color => '#7F8000', -end_color => 'white' },
  -activegradient => { -start_color => 'white', -end_color => '#7F8000' },
  -bitmap         => 'question',
  -compound       => 'left',
);
my $Button11 = $mw->ColoredButton(
  -text => "Button11",
  %ColoredButtonConf,
  -tooltip        => "Button11",
  -gradient       => { -start_color => 'green', -end_color => 'black' },
  -activegradient => { -start_color => 'gray50', -end_color => '#7F8000' },
  -imagedisabled  => $ObjImage2,
  -compound       => 'left',
);
my $Button12 = $mw->ColoredButton(
  -text => "Button12",
  %ColoredButtonConf,
  -tooltip  => "Button12",
  -gradient => { -start_color => 'pink', -end_color => '#8945C3', -number_color => 5, -type => 'radial' },
  -activegradient =>
    { -start_color => 'white', -end_color => '#60FF50', -number_color => 3, -type => 'linear_vertical' },
  -image          => $ObjImage,
  -compound       => 'left',
  -repeatdelay    => 5000,
  -repeatinterval => 1000,
  -state          => 'disabled',
  -imagedisabled  => $ObjImage2,
  -command        => sub { print "boutton 12\n"; },
);

my $RealButton1 = $mw->Button(
  -text => "Real button 1 - enabled button 11",
  %ButtonConf,
  -command => sub { $Button11->configure( -state => 'normal' ); $Button11->redraw_button; },

);
my $RealButton2 = $mw->Button(
  -repeatdelay    => 5000,
  -repeatinterval => 1000,
  -text           => "Real button 2 - disabled button 11",
  -command        => sub { $Button11->configure( -state => 'disabled' ); $Button11->redraw_button; },
);

$Button1->grid( $Button2,  $Button3,  $Button4,  qw/ -padx 10 -pady 10 / );
$Button5->grid( $Button6,  $Button7,  $Button8,  qw/ -padx 10 -pady 10 / );
$Button9->grid( $Button10, $Button11, $Button12, qw/ -padx 10 -pady 10 / );
$RealButton1->grid( $RealButton2, qw/ -padx 10 -pady 10 / );

MainLoop;

