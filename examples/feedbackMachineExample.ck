/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2012 held jointly by the individual authors.

    This file is part of LiCK.

    LiCK is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    LiCK is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with LiCK.  If not, see <http://www.gnu.org/licenses/>.

*/

FeedbackMachine fm;

1200::ms => fm.delay1.max;
1200::ms => fm.delay1.delay;
0.40 => fm.feedback1.gain;
0.80 => fm.output1.gain;

1600::ms => fm.delay2.max;
1600::ms => fm.delay2.delay;
0.40 => fm.feedback2.gain;
0.80 => fm.output2.gain;

200::ms => fm.delay3.max;
200::ms => fm.delay3.delay;
0.90 => fm.feedback3.gain;
0.80 => fm.output3.gain;

300::ms => fm.delay4.max;
300::ms => fm.delay4.delay;
0.90 => fm.feedback4.gain;
0.80 => fm.output4.gain;

0.1 => fm.route1to2.gain;
0.0 => fm.route1to3.gain;
0.3 => fm.route1to4.gain;
0.0 => fm.route2to1.gain;
0.1 => fm.route2to3.gain;
0.0 => fm.route2to4.gain;
0.0 => fm.route3to1.gain;
0.2 => fm.route3to2.gain;
0.1 => fm.route3to4.gain;
0.0 => fm.route4to1.gain;
0.3 => fm.route4to2.gain;
0.0 => fm.route4to3.gain;


BeeThree bt;
bt.noteOff(1.0);

bt => fm.input;

0.1 => fm.dry.gain;
0.9 => fm.wet.gain;

fm.dry => dac;
fm.wet => dac;


500::ms => now;
for (0 => int i; i < 10; i++)
{
    <<<i>>>;
    bt.noteOn(1.0);
    800::ms => now;
    bt.noteOff(1.0);
    800::ms => now;
}

8::second => now;

<<<"done">>>;