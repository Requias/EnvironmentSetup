dir=(\
$PWD/target/riscv/src/debussy_e1/e1a \
$PWD/target/riscv/src/debussy_e1/common \
)

rm tags
rm cscope*
rm file_list
find ${dir[@]} -name "*.c" -o -name "*.h" -o -name "*.cpp" > file_list

ctags -R $(cat file_list)
cscope -Rbqk -i file_list

