extern crate rand;  // randクレートを外部依存として使用する

use std::io;
use std::cmp::Ordering;
use rand::Rng;

fn main() {
    println!("Guess the number!");

    let secret_number = rand::thread_rng().gen_range(1, 101);

    loop {
        println!("Please input your guess.");

        let mut guess = String::new();  // 変数名の前にmutを付けると変更可能になる

        io::stdin().read_line(&mut guess)   // &を付けると参照になる
            .expect("Failed to read line");
        // read_lineメソッドがio::Resultを返す
        // io::Resultは列挙型でOkかErrである
        // io::Resultはexpectメソッドを持っている
        // Errの場合、expectメソッドはプログラムをクラッシュさせて引数として渡されたメッセージを表示する
        // いわゆる例外処理に当たるのかな。簡潔に書けて嬉しい。

        // guessを再定義しているように見えるが、
        // これはshadowingという機能を使って新しい値でguessの値を覆い隠している、とのこと
        // 詳しくは後で分かるかな
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        match guess.cmp(&secret_number) {
            Ordering::Less => println!("Too small!"),
            Ordering::Greater => println!("Too big!"),
            Ordering::Equal => {
                println!("You win!");
                break;
            }
        }

        println!("You guessed: {}", guess);
    }
}
