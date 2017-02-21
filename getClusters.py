#!/usr/bin/env python

import optparse

parser	= optparse.OptionParser()
parser.add_option(	"-i", 
			"--input", 
			dest="smash_result", 
			help="antiSMASH result", 
			metavar="SMASH RESULT"		)
(options, args) = parser.parse_args()

if not options.smash_result:
	parser.error("\nPlease specify input file.\n")

with open(options.smash_result, 'r') as f:
	lines	= f.readlines()

i=1

for line in lines:
	fields	= line.split("\t")
	names	= fields[3].split(";")
	for name in names:
		print "Cluster_" + str(i) + "\t" + name
	i += 1
	
