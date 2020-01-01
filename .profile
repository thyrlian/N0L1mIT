obfuscate() {
  if [ $# -lt 1 ]; then
    echo "Usage: $0 [file|directory ...]"
    return 1
  else
    error_flag=false
    for fd in $@
    do
      if [ ! -f $fd ] && [ ! -d $fd ]; then
        echo "Error: \"$fd\" is neither a file nor a directory"
        error_flag=true
      fi
    done
    if $error_flag; then
      echo "Please pass valid file or directory argument(s) and try again"
      return 1
    fi
  fi

  start_dir=$PWD
  for fd in $@
  do
    echo "☂ Packing \"$fd\""
    dir=$(dirname "$(realpath $fd)")
    file=$(basename "$(realpath $fd)")
    cd "$dir"
    head -c 1000 /dev/urandom > dummy_file
    tar cvf "packed_$file.tar" "$file" dummy_file
    rm dummy_file
    mv "packed_$file.tar" "$start_dir/packed_$file.tar" 2>/dev/null
    cd "$start_dir"
    echo ""
  done
}
