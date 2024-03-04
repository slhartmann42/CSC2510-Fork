#!/bin/bash
#Variables
total_files_moved=0
total_bytes_moved=0
images_moved=0
image_bytes=0
documents_moved=0
document_bytes=0
pdfs_moved=0
pdf_bytes=0
executables_moved=0
executable_bytes=0
data_files_moved=0
data_file_bytes=0
unknown_files_moved=0
unknown_bytes=0

#directory_checks
dnm="images"
if [ -d "$dnm" ]; then
	echo "The directory $dnm already exists. Skipping Creation."
else
	mkdir $dnm; echo "The directory $dnm was created."
fi

#documents
dnm="documents"
if [ -d "$dnm" ]; then
	echo "The directory $dnm already exists. Skipping Creation."
else
	mkdir $dnm; echo "The directory $dnm was created."
fi

dnm="pdfs"
if [ -d "$dnm" ]; then
	echo "The directory $dnm already exists. Skipping Creation."
else
	mkdir $dnm; echo "The directory $dnm was created."
fi

dnm="executables"
if [ -d "$dnm" ]; then
	echo "The directory $dnm already exists. Skipping Creation."
else
	mkdir $dnm; echo "The directory $dnm was created."
fi

dnm="data"
if [ -d "$dnm" ]; then
	echo "The directory $dnm already exists. Skipping Creation."
else
	mkdir $dnm; echo "The directory $dnm was created."
fi

dnm="unknown"
if [ -d "$dnm" ]; then
	echo "The directory $dnm already exists. Skipping Creation."
else
	mkdir $dnm; echo "The directory $dnm was created."
fi

echo "Moving files into respective directories..."
for file in *; do
	if [ -f "$file" ]; then
		if [ -x "$file" ]; then
		((total_files_moved++))
		((executables_moved++))
		filesize="$(stat -c%s "$file")"
		((total_bytes_moved+=filesize))
		((executable_bytes+=filesize))
		mv -n "$file" executables/"$file"
		else
		choice="${file##*.}"
			case $choice in
				jpg | jpeg | png | gif )
					((total_files_moved++))
					((images_moved++))
					filesize="$(stat -c%s "$file")"
					((total_bytes_moved+=filesize))
					((image_bytes+=filesize))
					mv -n "$file" images/"$file"
					;;
				txt | docx | doc | pages)
					((total_files_moved++))
					((documents_moved++))
					filesize="$(stat -c%s "$file")"
					((total_bytes_moved+=filesize))
					((document_bytes+=filesize))
					mv -n "$file" documents/"$file"
					;;
				key | pptx | ppt | odt | md)
					((total_files_moved++))
					((documents_moved++))
					filesize="$(stat -c%s "$file")"
					((total_bytes_moved+=filesize))
					((document_bytes+=filesize))
					mv -n "$file" documents/"$file"
					;;
				pdf)
					((total_files_moved++))
					((pdfs_moved++))
					filesize="$(stat -c%s "$file")"
					((total_bytes_moved+=filesize))
					((pdf_bytes+=filesize))
					mv -n "$file" pdfs/"$file"
					;;
				csv|xlsx|json)
					((total_files_moved++))
					((data_files_moved++))
					filesize="$(stat -c%s "$file")"
					((total_bytes_moved+=filesize))
					((data_file_bytes+=filesize))
					mv -n "$file" data/"$file"
					;;
				sh|exe)
					((total_files_moved++))
					((executables_moved++))
					filesize="$(stat -c%s "$file")"
					((total_bytes_moved+=filesize))
					((executable_bytes+=filesize))
					mv -n "$file" executables/"$file"
					;;
				*)
					((total_files_moved++))
					((unknown_files_moved++))
					filesize="$(stat -c%s "$file")"
					((total_bytes_moved+=filesize))
					((unknown_bytes+=filesize))
					mv -n "$file" unknown/"$file"
					;;
			esac
		fi
	fi
done
#outup results
echo "File move complete. Total files moved: $total_files_moved"
echo "Total file bytes moved: $total_bytes_moved"
avg=$((total_bytes_moved/total_files_moved))
echo "Average file size: $avg"
echo "*** Breakdown per file type ***"
echo "*** Images ***"
echo "Total moved: $images_moved, total size: $image_bytes"
avg=$((image_bytes/images_moved))
echo "Average file size: $avg"
echo "*** Documents ***"
echo "Total moved: $documents_moved, total size: $document_bytes"
avg=$((document_bytes/documents_moved))
echo "Average file size: $avg"
echo "*** PDFs ***"
echo "Total moved: $pdfs_moved, total size: $pdf_bytes"
avg=$((pdf_bytes/pdfs_moved))
echo "Average file size: $avg"
echo "*** Executables ***"
echo "Total moved: $executables_moved, total size: $executable_bytes"
avg=$((executable_bytes/executables_moved))
echo "Average file size: $avg"
echo "*** Data ***"
echo "Total moved: $data_files_moved, total size: $data_file_bytes"
avg=$((data_file_bytes/data_files_moved))
echo "Average file size: $avg"
echo "*** Unknown ***"
echo "Total moved: $unknown_files_moved, total size: $unknown_bytes"
avg=$((unknown_bytes/unknown_files_moved))
echo "Average file size: $avg"