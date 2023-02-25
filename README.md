# Elixirの環境構築

### asdfのインストール

公式
https://asdf-vm.com/

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
```

パスを通す

```bash
vi ~/.bashrc
```

<pre>
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
</pre>

```bash
source ~/.bashrc
```

```bash
which asdf
```

### ElixirとErlangのインストール

```bash
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
```

### Elixirのインストール

バージョンを指定してインストール
```bash
asdf list-all elixir
asdf install elixir 1.14.3
```

### Erlangのインストール

バージョンを指定してインストール
```bash
asdf list-all erlang
asdf install erlang 25.2.3
```

※パッケージが必要
```bash
sudo apt install libssl-dev automake autoconf libncurses5-dev
```

### ディレクトリ個別でバージョン切り替えする場合

作業用ディレクトリで実行
```bash
asdf local erlang 25.2.3
asdf local elixir 1.14.3
```

バージョン確認
```bash
asdf current
iex -v
```

### グローバルに設定する場合

```bash
asdf global elixir 1.14.3
asdf global erlang 25.2.3
```

```bash
asdf current
iex -v
```

### 各種コマンド

* プロジェクトの作成
```
mix new my_app
```

* パッケージのインストール
mix.exsのあるディレクトリで実行
```
mix deps.get
mix install
```

*  コンパイル
```
mix compile
```

* mix help
```
mix help
```

* 実行
```
mix run -e 'ModuleName.function() |> IO.puts';
```
