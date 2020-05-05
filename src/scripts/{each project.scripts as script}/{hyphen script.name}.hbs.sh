#!/usr/bin/env bash
set -e
PROJECT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}/../" && pwd)

SCRIPT_BASE_DIR="$PROJECT_BASE_DIR/scripts"
INCLUDES=$(find $SCRIPT_BASE_DIR/_{{lower-snake script.name}}/*.sh -type f)

LOCAL_REPO_PATH="$PROJECT_BASE_DIR/../mvn-repo"
if [[ -d "$PROJECT_BASE_DIR/subprojects/mvn-repo" ]]
then
  LOCAL_REPO_PATH="$PROJECT_BASE_DIR/subprojects/mvn-repo"
fi

OPT_NAMES='{{#each script.options as |option| ~}}
{{~if option.short_name option.short_name ""}}{{~if option.flag "" ":"}}
{{~/each}}-:'

{{#each script.options as |option| ~}}
{{upper-snake option.name}}={{if option.default_value (trim option.default_value)}}
{{/each}}

run_{{lower-snake script.name}}() {
  parse_args "$@"
  ! [ -z $VERBOSE ] && set -x
  ! [ -z $HELP ] && show_usage && exit 0
  main
}

parse_args() {
  while getopts $OPT_NAMES OPTION;
  do
    case $OPTION in
    -)
      case $OPTARG in
      {{#each script.options as |option|}}
      {{hyphen option.name}})
        {{upper-snake option.name}}={{if option.flag "'yes'" '("${!OPTIND}"); OPTIND=$(($OPTIND+1))'}};;
      {{/each}}
      *)
        echo "ERROR: Unknown OPTION --$OPTARG" >&2
        exit 1
      esac
      ;;
    {{#each (filter script.options 'this.short_name') as |option|}}
    {{option.short_name}}) {{upper-snake option.name}}={{if option.flag "'yes'" '("${!OPTIND}"); OPTIND=$(($OPTIND+1))'}};;
    {{/each}}
    esac
  done
}

show_usage () {
cat << END
Usage: $(basename "$0") [OPTION]...
  {{#each script.options as |option| ~}}
  {{if option.short_name (printf '-%s' option.short_name)}}, --{{hyphen option.name}}{{if option.flag '' ' [VALUE]'}}
    {{if option.description (shift option.description.en 4) option.name}}{{if option.default_value (printf ' (Default: %s)' (trim option.default_value))}}
  {{/each}}
END
}

source $INCLUDES
run_{{lower-snake script.name}} "$@"