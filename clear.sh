echo '------------------'
echo "Start cleaning"
echo '------------------'
echo 'Free space before'
echo '------------------'
df -Hl $HOME
echo '------------------'
find ~/ -name ".DS_Store" -print -delete 2> /dev/null
find ~/ -name "**.42_cache_bak**" -print -delete 2> /dev/null
rm -rf ~/.zcompdump*
rm -rf ~/Library/Caches/*
rm -rf ~/Library/42_cache
rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/
rm -rf ~/Library/Caches/*
rm -rf ~/Library/42_cache
rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/
rm -rf ~/Library/Application\ Support/Slack/Cache/
rm -rf ~/Library/Caches/*
rm -rf ~/Library/42_cache
rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/
rm -rf ~/Library/Application\ Support/Slack/Cache/
rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/
rm -rf ~/Library/Application\ Support/Slack/Cache/
rm -rf ~/Library/Developer/CoreSimulator/Caches/
rm -rf ~/Library/Developer/CoreSimulator/Devices/
rm -rf ~/Library/Logs/
rm -rf ~/Library/Google/GoogleSoftwareUpdate/
rm -rf ~/Library/Containers/com.apple.Safari/Data/Library/Caches/
rm -rf ~/Library/Application\ Support/Code/CachedData/
rm -rf ~/Library/Application\ Support/Slack/logs
rm -rf ~/Library/Application\ Support/zoom.us/AutoUpdater
rm -rf ~/Library/Application\ Support/Google/Chrome/BrowserMetrics/
rm -rf ~/Library/Application\ Support/Google/Chrome/BrowserMetrics-spare.pma
rm -rf ~/Library/Application\ Support/Google/Chrome/GrShaderCache/GPUCache/
rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Local\ Extension Settings/cjpalhdlnbpafiamejdnhcphjbkeiagm/lost
rm -rf ~/Library/Application\ Support/Code/Cache/
rm -rf ~/Library/Application\ Support/Code/CachedExtensionVSIXs/
rm -rf ~/Library/Application\ Support/Code/Code\ Cache/
rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/CacheStorage/
rm -rf  ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/ScriptCache/
rm -rf ~/Library/Application\ Support/Google/Chrome/ShaderCache/GPUCache/
rm -rf ~/Library/Application\ Support/Code/CachedExtensions/
rm -rf ~/Library/Application\ Support/Code/logs/
rm -rf ~/Library/Application\ Support/Code/Service\ Worker/CacheStorage/
rm -rf ~/Library/Application\ Support/Code/Service\ Worker/ScriptCache/
rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage/    
rm -rf ~/.Trash/*
#rm -rf ~/Desktop/Pre*
rm -rf ~/Documents/*
rm -rf ~/Movies/*
rm -rf ~/Music/*
rm -rf ~/Pictures/*
echo 'Free space after'
echo '------------------'
df -Hl $HOME
echo '------------------'
echo "Cleaning completed"
echo '------------------'
