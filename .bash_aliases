# check if two files are identical
ctf() {
    cmp --silent $1 $2 && echo '### SUCCESS: Files Are Identical! ###' || echo '### WARNING: Files Are Different! ###'
}

# convert a dos file to unix
d2u() {
    sed -i 's/\r$//' $1
}

# convert a unix file to dos
u2d() {
    sed -i '/\r/! s/$/\r/' $1
}

# delete all tmp files
alias ds='find . -type f -name "*.sw[klmnop]" -delete'

# make with customized options
alias MAKE='make --quiet 2>&1 | tee output.log'
