#!/usr/bin/env sh

classes=(Event Record-levels Occurrence Taxon MaterialSample Organism Identification Location GeologicalContext MeasurementOrFacts ResourceRelationship)
for (( i=0;i<=10; i++))
do
    awk -F'\t' 'NR>1 {print $1":Term ("$12")\t"$4"\t"$5"\t"$6}' vocabularies/${classes[${i}]}.tsv | grep -v "\t\t\t" > dist/${classes[${i}]}_Terms.csv
    awk -F'\t' 'NR>1 {print $1":Definition of "$4" ("$12")\t"$6"\t"$7"\t"}' vocabularies/${classes[${i}]}.tsv |  grep -v "\t\t\t" >> dist/${classes[${i}]}_Terms.csv
    awk -F'\t' 'NR>1 {print $1":Comments of "$4" ("$12")\t"$8"\t"$9"\t"}' vocabularies/${classes[${i}]}.tsv |  grep -v "\t\t\t" >> dist/${classes[${i}]}_Terms.csv
    awk -F'\t' 'NR>1 {print $1":Examples of "$4" ("$12")\t"$10"\t"$11"\t"}' vocabularies/${classes[${i}]}.tsv |  grep -v "\t\t\t" >> dist/${classes[${i}]}_Terms.csv
done
