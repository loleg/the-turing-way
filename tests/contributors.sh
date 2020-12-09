#! /bin/bash
# Copy the latest contributors.md file content to afterword
# this will publish the contributors file online in The Turing Way book

all_contributors=$(find . -type f -name README.md) # Path to the main README file of The Turing Way
contributors_highlight=$(find . -type f -name contributors.md)
contributors_record=$(find ./book/website/afterword/ -type f -name contributors-record.md)

# Copy everything from the contributors highlight
echo '(aw-contributors-record-highlights)=' > $contributors_record
cat $contributors_highlight >> $contributors_record

# # Get linenumber where all contributors list starts
line_num=$(grep -n '## Contributors' $all_contributors | cut -d: -f1)
echo '\n(aw-contributors-record-contributors)=' >> $contributors_record

tail -n +"$line_num" "$all_contributors" | while read line;
do
  echo $line >> $contributors_record
done