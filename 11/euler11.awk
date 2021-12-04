BEGIN {max = 0}

{
sum = $1*$2*$3*$4
if (sum > max)
	max = sum
}

END {print max}
