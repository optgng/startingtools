echo '------------------'
echo "Start cleaning"
echo '------------------'
echo 'Free space before'
echo '------------------'
df -Hl $HOME
echo '------------------'
rm -rf ~/Library/Caches/*
rm -rf ~/Library/42_cache
rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/
rm -rf ~/Library/Application\ Support/Slack/Cache/
rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/
rm -rf ~/.Trash/*
#rm -rf ~/Desktop/Pre*
rm -rf ~/Documents/*
rm -rf ~/Movies/*
rm -rf ~/Music/*
rm -rf ~/Pictures/*
rm -rf ~/.Trash/*
echo 'Free space after'
echo '------------------'
df -Hl $HOME
echo '------------------'
echo "Cleaning completed"
echo '------------------'
