#!/bin/sh
#
# prototype in shell
# this is messy and ugly

ACTION=$1 shift
DB=db/setec.sqlite
sqlite="sqlite3 -echo"

function fetch_object() {
  local object=$1
  local target=$2
  local attrib=${3:-name}
  local name_col='title'

  ${sqlite} -column -header ${DB} "SELECT ${attrib} FROM '${object}' WHERE ${name_col} like '%${target}%';"
}

function create_object() {
  local object=$1
  local target=$2
  shift
  shift

  case $target in
    user)
      COLUMNS="('name', 'email', 'public_key', 'private_key')"
      ;;
    record)
      COLUMNS="('name', 'description', 'username', 'password', 'comments')"
      ;;
    group)
      ;;
    *)
      ;;
  esac



  VALUES="('${target}', $*)"

  echo ${sqlite} "INSERT INTO '${object}' ${COLUMNS} VALUES ${VALUES};"
  
}



case $ACTION in
  fetch)
    fetch_object $*
    ;;
  update)
    ;;
  create)
    create_object $*
    ;;
  *)
    ;;
esac
