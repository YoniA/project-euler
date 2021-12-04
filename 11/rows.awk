BEGIN {FS=" "}

{
for(i=1; i<NF-2;i++)
	print $i, $(i+1), $(i+2), $(i+3)
}
