#!/bin/bash

# Kill Conky If Running
test -z "`pgrep conky`" || killall -9 conky

# Normal Text Color
DEFAULT="000"		# Black
#DEFAULT="FFF"		# White

# Highlight Text Color
COLOR1="000"
#COLOR1="AAA"		# Light Grey
#COLOR1="555"		# Grey
#COLOR1="333"		# Dark Grey
#COLOR1="302704" 	# Brown
#COLOR1="a21212" 	# Red
#COLOR1="D1940C"	# Gold

# The directory of conkyrcs
conky_dir="/home/cmauch/.conky/ConkyGold/conkyrc"
template_dir="/home/cmauch/.conky/ConkyGold/templates"

# The command for start conkys
START="conky -d -c"

sleep 0.5
cp $template_dir/cpu $conky_dir/cpu
sed -i 's/DEFAULT/'$DEFAULT'/g' $conky_dir/cpu
sed -i 's/COLOR1/'$COLOR1'/g' $conky_dir/cpu
$START $conky_dir/cpu

sleep 0.2
cp $template_dir/time $conky_dir/time
sed -i 's/DEFAULT/'$DEFAULT'/g' $conky_dir/time
sed -i 's/COLOR1/'$COLOR1'/g' $conky_dir/time
$START $conky_dir/time

sleep 0.2
cp $template_dir/mem $conky_dir/mem
sed -i 's/DEFAULT/'$DEFAULT'/g' $conky_dir/mem
sed -i 's/COLOR1/'$COLOR1'/g' $conky_dir/mem
$START $conky_dir/mem

sleep 0.2
cp $template_dir/disk $conky_dir/disk
sed -i 's/DEFAULT/'$DEFAULT'/g' $conky_dir/disk
sed -i 's/COLOR1/'$COLOR1'/g' $conky_dir/disk
$START $conky_dir/disk

sleep 0.2
cp $template_dir/net $conky_dir/net
sed -i 's/DEFAULT/'$DEFAULT'/g' $conky_dir/net
sed -i 's/COLOR1/'$COLOR1'/g' $conky_dir/net
$START $conky_dir/net
