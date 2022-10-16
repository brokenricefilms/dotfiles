# !/usr/bin/env zsh

alias add='git add'
alias push="git push"
alias pushf="git push -f"
alias pull="git pull"
alias dv='git difftool'
alias gl='git log --oneline | head -n 5'
alias lg='lazygit'

function change_dir_to_git_root() {
  cd $(git rev-parse --show-toplevel)
}
alias cdr='change_dir_to_git_root'

is_in_git_repo() { git rev-parse HEAD &>/dev/null }

function git_status() {
  is_in_git_repo || return
  git status -sb
}
alias st='git_status'

function auto_commit () {
  is_in_git_repo || return
  git add -A
  git commit -m "[👌Auto commit] $(curl -s whatthecommit.com/index.txt)"
}

function ok () {
  is_in_git_repo || return
  st
  auto_commit
  push
}

function okp () {
  is_in_git_repo || return
  prettier --write *
  st
  auto_commit
  push
}

function go_to_git_clone_repo_dir () {
  gitDir="$(basename "$1" .git)"
  gitDirResolved=${2:-$gitDir}
  git clone "$@" && cd "$gitDirResolved";
}
alias gc='go_to_git_clone_repo_dir'

function yo () {
  git diff
  git add .
  echo "👉 What is commmit message?"
  read commitMessage
  git commit -m $commitMessage
  git push &
}

function ghi() {
  local item
  item=$(gh issue list | fzf | awk '{print $1}')
  gh issue view $item --web
}

function auto_sync {
  repo=(
    /home/master/sync/ok
    /home/master/sync/obs-studio
    /home/master/repos/thuanpham2311/co_so_du_lieu
    /home/master/repos/thuanpham2311/dataLab
    /home/master/repos/thuanpham2311/ky_thuat_lap_trinh
    /home/master/repos/thuanpham2311/lap_trinh_huong_doi_tuong
    /home/master/repos/thuanpham2311/nhap_mon_cau_truc_du_lieu
    /home/master/repos/thuanpham2311/nhap_mon_web_va_ung_dung
    /home/master/repos/thuanpham2311/thuc-hanh-ky-thuat-lap-trinh
    /home/master/repos/thuanpham2311/thuc-hanh-lap-trinh-huong-doi-tuong
    /home/master/repos/thuanpham2311/thuc-hanh-nhap-mon-cau-truc-du-lieu
    /home/master/repos/thuanpham2311/thuc-hanh-nhap-mon-web-va-ung-dung
    /home/master/repos/thuanpham2311/thuc_thanh_nhap_mon_lap_trinh
    /home/master/repos/thuanpham2311/ublock_adblock_list
    /home/master/repos/thuanpham2311/cong_nghe_phan_mem
    /home/master/repos/thuanpham2311/thuan_ublacklist
    /home/master/repos/thuanpham2311/lap_trinh_ung_dung_co_so_du_lieu
    /home/master/repos/thuanpham2311/quan_tri_co_so_du_lieu
    /home/master/repos/thuanpham2311/ma_hoa_ung_dung
    /home/master/repos/thuanpham2311/img
    /home/master/repos/thuanpham2311/lap_trinh_cho_thiet_bi_di_dong/
    /home/master/repos/thuanpham2311/lap_trinh_web/
    /home/master/repos/thuanpham2311/phat_trien_phan_mem_nguon_mo/
  )

  for i in ${repo[*]}
  do
    cd "$i"
    pwd
    auto_commit
    push
  done
}

function update_all_repo() {
  for dir in ~/repos/thuanpham2311/*
  do
    cd "$dir"
    pwd
    pull
    push
    cd - > /dev/null
  done

  for dir in ~/repos/OngDev/*
  do
    cd "$dir"
    pwd
    pull
    push
    cd - > /dev/null
  done

  for dir in ~/repos/isekaiSystem/*
  do
    cd "$dir"
    pwd
    pull
    push
    cd - > /dev/null
  done

  repoNotInDefaultDir=(
    ~/dotfiles/
    ~/repos/OngDev/.github/
  )

  for i in ${repoNotInDefaultDir[*]}
  do
    cd "$i"
    pwd
    pull
    push
    cd - > /dev/null
  done
}

function swich_branch() {
  is_in_git_repo || return
  git branch -a | fzfDown | xargs git switch
}
alias sb='swich_branch'

function github_issue_list() { gh issue list | fzf | cut -f1 | copy}
alias gil='github_issue_list'

function github_issue_close() {
  id="$(gh issue list | fzf | cut -f1)"
  [ -n "$id" ]
  gh issue close "$id"
}
alias gic='github_issue_close'

function github_issue_view_web() {
  id="$(gh issue list | fzf | cut -f1)"
  [ -n "$id" ]
  gh issue view "$id" --web &> /dev/null
}
alias iv='github_issue_view_web'

function github_issue_comment() {
  id="$(gh issue list | fzf | cut -f1)"
  [ -n "$id" ]
  gh issue comment "$id"
}
alias gim='github_issue_comment'
