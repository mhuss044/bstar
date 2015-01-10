#!/bin/bash
# bang line, indicates the interpreter to use
wid=$1					# assign wid to passed num
					# := if var not set/empty?, give val of 5
echo ${wid:=5}				# less ammbiguous what the var name is than $ctr
neg=$((-wid))
printf "%d\n" $neg

sleepTime=0.01
lastWid=$wid

winWid=$(tput cols) 			# Get window width
#winHig=$(tput lines)
#tput cup 4 5				# make another prog, where diamond drawn in center, expands, distorts, moving partern from center 

while ((1))
	do
		spc=1
		ctr=1
		col=1 					# Print half of a diamond
		while ((ctr <= wid))			# ((expression)) no $ on var names in expression, spaces dont matter
			do
				spc=1
				while ((spc <= (winWid+(wid-ctr))/2))
					do
						printf " "
						spc=$((spc+1))
					done
				col=1
				while ((col <= ctr)) 
					do
					printf "*"
						col=$(( col+1 ))
						sleep $sleepTime
					done
				printf "\n"
				ctr=$(( ctr+1 ))
			done	
		ctr=$wid				# Print second half of diamond
		while ((ctr >= 1))			# ((expression)) no $ on var names in expression, spaces dont matter
			do
				spc=1
				while ((spc <= (winWid+(wid-ctr))/2))
					do
						printf " "
						spc=$((spc+1))
					done
				col=1
				while ((col <= ctr)) 
					do
						printf "*"
						col=$(( col+1 ))
						sleep $sleepTime
					done
				printf "\n"
				ctr=$(( ctr-1 ))
			done	
			
			if read -s -t 0.01 lastWid
				then
					lastWid=$wid
			fi
	done

# clear; tput cup 10 5; read -p 'Hello world!' 
