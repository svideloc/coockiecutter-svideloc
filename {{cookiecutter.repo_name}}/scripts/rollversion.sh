#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

version='unset'

usage() {
    echo "USAGE: ./rollVersion.sh <-v VERSION | -s SUFFIX>"
    echo ""
    echo " -v <VERSION> Will set absolute version to the value of VERSION"
    echo " -s <SUFFIX> Will append .SUFFIX to the current version (do not include a period in your suffix value)"
}

checkOpts() {
  if [ $version != "unset" ]; then
    usage
    echo ""
    echo "You must provide only one of '-v VERSION' or '-s VERSION_SUFFIX' (e.g. -s \$BUILD_NUMBER)"
    exit 1
  fi
}

while getopts ":v:s:" opt; do
  case ${opt} in
    v )
      checkOpts
      version=$OPTARG
      ;;
    s )
      checkOpts
      base=$(cat $DIR/../nickel/_version.py | grep "VERSION" | grep -o '".*"' | tr -d '"')
      suffix="$OPTARG"
      version="${base}.${suffix}"
      ;;
    \? )
      usage
      echo
      echo "Invalid option: $OPTARG" 1>&2
      exit 1
      ;;
    : )
      usage
      echo
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      exit 1
      ;;
  esac
done

if [ $version == "unset" ]; then
  echo "You must provide either '-v VERSION' or '-s VERSION_SUFFIX' (e.g. -s \$BUILD_NUMBER)"
  exit 1
fi

writeVersion() {
    subdir=$1
    file="$DIR/../$subdir/_version.py"
    echo "# WARNING: This file was automatically generated on $(date) by $(hostname) using rollversion.sh" > $file
    echo "# Do not hand modify without ensuring this file can be parsed by non python parsers (e.g., rollverison.sh)" >> $file
    echo "VERSION = \"${version}\"" >> $file
}

echo "Setting module(s) to version: $version"
writeVersion "nickel"
