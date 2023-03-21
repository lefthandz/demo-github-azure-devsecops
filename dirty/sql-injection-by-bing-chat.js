// ユーザーからの入力を受け取る
var userId = req.body.userId;
// 入力をそのままSQL文に組み込む
var sql = "SELECT * FROM users WHERE id = '" + userId + "'";
// SQL文を実行する
db.query(sql, function (err, result) {
  // 結果を返す
  res.send(result);
});
