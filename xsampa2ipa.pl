#!/usr/bin/perl

use strict;

use vars qw($VERSION %IRSSI);
use Irssi qw(signal_add signal_continue);

$VERSION = '0.1b';
%IRSSI = (
    authors     => 'schnorrer',
    contact     => 'levi.schnorrer@gmail.com',
    name        => 'xsampa2ipa',
    description => 'Replaces your [[X-SAMPA]] in double brackets with [IPA].',
    license     => 'BSD',
);

my (%st_0,  %st_1,  %st_2,  %st_3,  %st_4,  %st_5,  %st_6,  %st_7,  %st_8,  %st_9,  %st_10, %st_11,
    %st_12, %st_13, %st_14, %st_15, %st_16, %st_17, %st_18, %st_19, %st_20, %st_21, %st_22, %st_23,
    %st_24, %st_25, %st_26, %st_27, %st_28, %st_29, %st_30, %st_31, %st_32, %st_33, %st_34, %st_35,
    %st_36, %st_37, %st_38, %st_39, %st_40, %st_41, %st_42);

my %st_map = (0 => \%st_0,  1 => \%st_1,  2 => \%st_2,  3 => \%st_3,  4 => \%st_4,  5 => \%st_5,
              6 => \%st_6,  7 => \%st_7,  8 => \%st_8,  9 => \%st_9,  10=> \%st_10, 11=> \%st_11,
              12=> \%st_12, 13=> \%st_13, 14=> \%st_14, 15=> \%st_15, 16=> \%st_16, 17=> \%st_17,
              18=> \%st_18, 19=> \%st_19, 20=> \%st_20, 21=> \%st_21, 22=> \%st_22, 23=> \%st_23,
              24=> \%st_24, 25=> \%st_25, 26=> \%st_26, 27=> \%st_27, 28=> \%st_28, 29=> \%st_29,
              30=> \%st_30, 31=> \%st_31, 32=> \%st_32, 33=> \%st_33, 34=> \%st_34, 35=> \%st_35,
              36=> \%st_36, 37=> \%st_37, 38=> \%st_38, 39=> \%st_39, 40=> \%st_40, 41=> \%st_41,
              42=> \%st_42);

%st_0 = ('a' => ['a',0],  'c' => ['c',0],  'e' => ['e',0],  'f' => ['f',0],
         'i' => ['i',0],  'k' => ['k',0],  'm' => ['m',0],  'o' => ['o',0],
         'q' => ['q',0],  'u' => ['u',0],  'w' => ['w',0],  'y' => ['y',0],
         'A' => ['ɑ',0],  'C' => ['ç',0],  'D' => ['ð',0],  'E' => ['ɛ',0],
         'F' => ['ɱ',0],  'P' => ['ʋ',0],  'Q' => ['ɒ',0],  'S' => ['ʃ',0],
         'T' => ['θ',0],  'V' => ['ʌ',0],  'W' => ['ʍ',0],  'Y' => ['ʏ',0],
         'Z' => ['ʒ',0],  '.' => ['.',0],  '"' => ['ˈ',0],  '%' => ['ˌ',0],
         "'" => ['ʲ',0],  '{' => ['æ',0],  '}' => ['ʉ',0],  '1' => ['ɨ',0],
         '2' => ['ø',0],  '4' => ['ɾ',0],  '5' => ['ɫ',0],  '6' => ['ɐ',0],
         '7' => ['ɤ',0],  '8' => ['ɵ',0],  '9' => ['œ',0],  '&' => ['ɶ',0],
         '^' => ['↑',0],

         'h' => ['', 1],  'j' => ['', 2],  'p' => ['', 3],  'v' => ['', 4],
         'x' => ['', 5],  'B' => ['', 6],  'H' => ['', 7],  'I' => ['', 8],
         'K' => ['', 9],  'L' => ['',10],  'M' => ['',11],  'N' => ['',12],
         'O' => ['',13],  'R' => ['',14],  'U' => ['',15],  'X' => ['',16],
         '@' => ['',17],  '3' => ['',18],  '?' => ['',19],  '!' => ['',20],
         
         'n' => ['',21],  't' => ['',22],
         'b' => ['',23],  'g' => ['',24],
         
         'd' => ['',27],  'l' => ['',29],  's' => ['',30],  'z' => ['',31],
         'r' => ['',32],  'G' => ['',34],  'J' => ['',37],  '_' => ['',40],
         ':' => ['',42],
         
         ' ' => ['', 0],  '__'=> ['', 0]);

%st_1 = ("\\"=> ['ɦ',0],  '__'=> ['h',0,1]);    %st_2 = ("\\"=> ['ʝ',0],  '__'=> ['j',0,1]);
%st_3 = ("\\"=> ['ɸ',0],  '__'=> ['p',0,1]);    %st_4 = ("\\"=> ['ʋ',0],  '__'=> ['v',0,1]);

%st_5 = ("\\"=> ['ɧ',0],  '__'=> ['x',0,1]);    %st_6 = ("\\"=> ['ʙ',0],  '__'=> ['β',0,1]);
%st_7 = ("\\"=> ['ʜ',0],  '__'=> ['ɥ',0,1]);    %st_8 = ("\\"=> ['ᵻ',0],  '__'=> ['ɪ',0,1]);

%st_9 = ("\\"=> ['ɮ',0],  '__'=> ['ɬ',0,1]);    %st_10= ("\\"=> ['ʟ',0],  '__'=> ['ʎ',0,1]);
%st_11= ("\\"=> ['ɰ',0],  '__'=> ['ɯ',0,1]);    %st_12= ("\\"=> ['ɴ',0],  '__'=> ['ŋ',0,1]);

%st_13= ("\\"=> ['ʘ',0],  '__'=> ['ɔ',0,1]);    %st_14= ("\\"=> ['ʀ',0],  '__'=> ['ʁ',0,1]);
%st_15= ("\\"=> ['ᵿ',0],  '__'=> ['ʊ',0,1]);    %st_16= ("\\"=> ['ħ',0],  '__'=> ['χ',0,1]);

%st_17= ("\\"=> ['ɘ',0],  '__'=> ['ə',0,1]);    %st_18= ("\\"=> ['ɞ',0],  '__'=> ['ɜ',0,1]);
%st_19= ("\\"=> ['ʕ',0],  '__'=> ['ʔ',0,1]);    %st_20= ("\\"=> ['ǃ',0],  '__'=> ['↓',0,1]);


%st_21= ('`' => ['ɳ',0],  '__'=> ['n',0,1]);    %st_22= ('`' => ['ʈ',0],  '__'=> ['t',0,1]);

%st_23= ('_' => ['',25],  '__'=> ['b',0,1]);    %st_24= ('_' => ['',26],  '__'=> ['g',0,1]);
%st_25= ('<' => ['ɓ',0],  '__'=> ['b',0,2]);    %st_26= ('<' => ['ɠ',0],  '__'=> ['g',0,2]);

%st_27= ('_' => ['',28],  '`' => ['ɖ',0],  '__'=> ['d',0,1]);
%st_28= ('<' => ['ɗ',0],  '__'=> ['d',0,2]);

%st_29= ("\\"=> ['ɺ',0],  '`' => ['ɭ',0],  '__'=> ['l',0,1]);
%st_30= ("\\"=> ['ɕ',0],  '`' => ['ʂ',0],  '__'=> ['s',0,1]);
%st_31= ("\\"=> ['ʑ',0],  '`' => ['ʐ',0],  '__'=> ['z',0,1]);

%st_32= ("\\"=> ['',33],  '`' => ['ɽ',0],  '__'=> ['r',0,1]);
%st_33= ('`' => ['ɻ',0],  '__'=> ['ɹ',0,1]);

%st_34= ("\\"=> ['',35],  '__'=> ['ɣ',0, 1]);
%st_35= ('_' => ['',36],  '__'=> ['ɢ',0,-1]);
%st_36= ('<' => ['ʛ',0],  '__'=> ['ɢ',0, 1]);

%st_37= ("\\"=> ['',38],  '__'=> ['ɲ',0, 1]);
%st_38= ('_' => ['',39],  '__'=> ['ɟ',0,-1]);
%st_39= ('<' => ['ʄ',0],  '__'=> ['ɟ',0, 1]);

%st_40= ('?' => ['',41],  'G' => ['ˠ',0],  'h' => ['ʰ',0],  'j' => ['ʲ',0],
         'n' => ['ⁿ',0],  'w' => ['ʷ',0],  '__'=> ['',0,1]);

%st_41= ("\\"=> ['ˤ',0],  '__'=> ['',0,2]);

%st_42 =("\\"=> ['ˑ',0],  '__'=> ['ː',0,1]);

sub conv {
    my @arr = split //, shift;
	push @arr, ' ';
	my $i = 0;
	my $rz = "";
    my ($symbol, $next_st, $step_back) = @{$st_0{$arr[$i]}};
    
    while ($i <= $#arr) {
        $rz .= $symbol;
		$i++;
        $i -= $step_back if $step_back;
		
        my %goto_st = %{$st_map{$next_st}};
        
        ($symbol, $next_st, $step_back)  = exists($goto_st{$arr[$i]}) ?
                                           @{$goto_st{$arr[$i]}} :
                                           @{$goto_st{'__'}};
    };    

	return $rz;
}

sub replace_xs {
    my ($msg, $server, $witem) = @_;
    $msg =~ s/\[\[(.*?)\]\]/'[' . conv($1) . ']'/eg;
    signal_continue($msg, $server, $witem);
}

signal_add("send text", \&replace_xs);