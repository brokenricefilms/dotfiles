#! /usr/bin/env sh

if ls $argv | grep ".cpp"
then
    cowsay "run $argv"
    echo "====Result===="
    echo ""
    g++ $argv
    ./a.out
    rm a.out
elif ls $argv | grep ".c"
then
    cowsay "run $argv"
    echo "====Result===="
    echo ""
    gcc $argv
    ./a.out
    rm a.out
elif ls $argv | grep ".html"
then
    cowsay "run $argv"
    echo "====Result===="
    echo ""
    brave-browser --new-window $argv
elif ls $argv | grep ".js"
then
    cowsay "run $argv"
    echo "====Result===="
    echo ""
    node $argv
elif ls $argv | grep ".py"
then
    cowsay "run $argv"
    echo ""
    echo "====Result===="
    python $argv
elif ls $argv | grep ".go"
then
    cowsay "run $argv"
    echo "====Result===="
    echo ""
    go run $argv
elif ls $argv | grep ".sh"
then
    cowsay "run $argv"
    echo "====Result===="
    echo ""
    chmod +x $argv && ./$argv
fi
