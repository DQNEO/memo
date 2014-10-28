# Bash Memo

## 配列

```bash
ary=(x y z)

for e in ${ary[@]}
do
    echo $e
done
```

縦に並べて書ける

```bash
ary=(
x
y
z
)
```

