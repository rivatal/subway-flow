function shut(list){
    if(close(list)){
	print list "failed to close" > "/dev/stderr";
    }
}
#By Riva Tropp
#Takes a table, puts in two files, one with match accuracies < 1, one without.
BEGIN{

table = "matchtable.txt"
notcorrect = "easymatches.txt"
correct = "readyformerge.txt"

FS = ","
while((getline < table) > 0){
    if ($2 <= 1)
	print $0 > correct
    else
	print $0 > notcorrect
}
shut(table)
}

