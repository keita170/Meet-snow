/*global $*/
/*global location*/

//ユーザー検索機能の記述ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
$(document).on('turbolinks:load', function(){
  const inputForm = $('.search_user_phone');
  const url = location.href;
  const searchResult = $('#result_user_phone');

  function builtHTML(data){
    let html = `
        <div class="col-md-5 d-flex align-items-center justify-content-center offset-md-2 col-8 offset-1">
          <a href="/users/${data.id}" class="link text-center ml-5">${data.name}:<span class="font-weight-bold">${data.status}</span></a>
        </div><hr width="17%" class="offset-md-4 offset-4">
    `
    searchResult.append(html);
  }

  function NoResult(message){
    let html = `
    <div class="col-md-5 offset-md-4"><br>
    <p>${message}</p><br>
    </duv>
    `
    searchResult.append(html);
  }

  // フォームに入力すると発火する
  inputForm.on('keyup', function(){
    const target = $(this).val();
    search(target);
  });

  // ajax処理
  function search(target){
    $.ajax({
      type: 'GET',
      url: '/users/search',
      data: {keyword: target},
      dataType: 'json'
    })
    .done(function(data){
      searchResult.empty(); //再度検索した際に前のデータを消す処理
      if (data.length !== 0) {
        data.forEach(function(data) { //dataは配列型に格納されているのでEach文で回す
          builtHTML(data)
        });
      } else {
        NoResult('該当するユーザーはいません')
      }
    })
    .fail(function(data){
      alert('非同期通信に失敗しました');
    })
  }
});
