#!/usr/bin/env osascript
function run(argv){ 
  console.log(argv.length + "つ引数が渡されました。");
  console.log(JSON.stringify(argv));
}
