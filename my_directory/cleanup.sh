#!/bin/bash
#Variables
#totatl_files_moved=0
#total_bytes_moved=0
#images_moved=0
#image_bytes_0
#documents_moved=0
#document_bytes=0
#pfs_moved=0
#pbf_bytes=0
#executables_moved=0
#executable_bytes=0
#data_files_moved=0
#data_file_bytes=0

#directory_checks
dnm="images"
if [ -d "$dnm" ]; then
	echo "The directory $dnm already exists."
else
	mkdir $dnm; echo "The directory $dnm was created."
fi

#documents
dnm="documents"
if [ -d "$dnm" ]; then
	echo "The directory $dnm already exists."
else
	mkdir $dnm; echo "The directory $dnm was created."
fi

dnm="pdfs"
if [ -d "$dnm" ]; then
	echo "The directory $dnm already exists."
else
	mkdir $dnm; echo "The directory $dnm was created."
fi

dnm="executables"
if [ -d "$dnm" ]; then
	echo "The directory $dnm already exists."
else
	mkdir $dnm; echo "The directory $dnm was created."
fi

dnm="data"
if [ -d "$dnm" ]; then
	echo "The directory $dnm already exists."
else
	mkdir $dnm; echo "The directory $dnm was created."
fi

dnm="unknown"
if [ -d "$dnm" ]; then
	echo "The directory $dnm already exists."
else
	mkdir $dnm; echo "The directory $dnm was created."
fi

