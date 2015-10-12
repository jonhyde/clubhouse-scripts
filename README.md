# Clubhouse-scripts
Repository for scripts

##Script 1
The Clubhouse-Story_Extract script takes a command line argument to run the script with both the project number and your API key as variables.

So your command line message should look something like:

ruby Clubhouse_Story_Extract.rb 9 {api-key-here}

Once executed it should go off and collect all the necessary data and then open the csv file with all the data.

Currently the script extracts the story ID, name, story type, labels, estimate, the epic name, the long description and the workflow state.

I'm planning on taking this script further by passing the data into a formatting script of some description where it will then auto-format it for me and present me with the ability to send straight to print the cards. For now I'm just opening the csv file in a word mailmerge and printing from there. Basic I know! :)
